require_dependency "ragnarok2/application_controller"

module Ragnarok2
  class CitizenDropsController < ApplicationController
    helper "ragnarok2/citizens"
    helper "ragnarok2/items"

    before_filter :authenticate_user!

    def new
      authorize!(:create, CitizenDrop)
      if params[:citizen_id]
        @base_model = Citizen.find(params[:citizen_id])
      else
        @base_model = Item.find(params[:item_id])
      end
      @drop = @base_model.drops.new
      respond_with
    end

    def create
      authorize!(:create, CitizenDrop)
      if params[:citizen_id]
        @base_model = Citizen.find(params[:citizen_id])
        
        params.each do |key, value|
          if key.match(/^result_([1-9]\d*)$/)
              drop = @base_model.drops.where(:item_id=>$1).first_or_create
              unless drop.users.exists?(current_user)
                drop.users << current_user
              end
          end
        end

      else
        @base_model = Item.find(params[:item_id])

        params.each do |key, value|
          if key.match(/^result_([1-9]\d*)$/)
              drop = @base_model.drops.where(:citizen_id=>$1).first_or_create
              unless drop.users.exists?(current_user)
                drop.users << current_user
              end
          end
        end
      end


      respond_to do |format|
        if @base_model.save
          format.html { redirect_to @base_model, notice: 'Drops were successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end

    def destroy
      @drop = CitizenDrop.find(params[:id])
      authorize!(:destroy, @drop)
      @drop.destroy
      
      respond_to do |format|
        format.html { redirect_to @drop.citizen, notice: 'Drop was successfully deleted.' }
      end
    end

    def search
      authorize!(:create, CitizenDrop)

      @results = []
      if params[:citizen_id]
        @citizen = Citizen.find(params[:citizen_id])
        @results = Item.default_order.search_by_name(params[:q]).limit(15)
        unless @citizen.items.empty?
          @results = @results.where("ragnarok2_items.id NOT IN (?)", @citizen.items)
        end
      end
      if params[:item_id]
        @item = Item.find(params[:item_id])
        @results = Citizen.default_order.search_by_name(params[:q]).limit(15)
        unless @item.citizens.empty?
          @results = @results.where("ragnarok2_citizens.id NOT IN (?)", @item.citizens)
        end
      end

      respond_to do |format|
        format.js
        format.html {
          @drop = @citizen.drops.new
          render 'new'
        }
      end

    end

    def vote
      @citizen_drop = CitizenDrop.find(params[:id])
      authorize!(:vote, @citizen_drop)

      vote = @citizen_drop.votes.where(:user_id=>current_user.id).first_or_initialize

      case
        when params[:approve] && (params[:approve].to_i==1 || params[:approve].to_i==0)
          vote.approved = !params[:approve].to_i.zero?
          vote.save
        when params[:retire] && params[:retire].to_i==1
          vote.destroy
      end


      if params[:ref]=="citizen"
        redirect_to @citizen_drop.citizen, :notice=>"Saved."
      else
        redirect_to @citizen_drop.item, :notice=>"Saved."
      end
      return
    end
  end
end

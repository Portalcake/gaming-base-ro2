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
      params[:search_result] = {} unless params[:search_result] && params[:search_result].kind_of?(Hash)

      if params[:citizen_id]
        @base_model = Citizen.find(params[:citizen_id])
        
        params[:search_result].each do |key, value|
          if value.to_i==1
              drop = @base_model.drops.where(:item_id=>key).first_or_initialize
              unless drop.users.exists?(current_user)
                drop.users << current_user
                drop.save
              end
          end
        end

      else
        @base_model = Item.find(params[:item_id])

        params[:search_result].each do |key, value|
          if value.to_i==1
              drop = @base_model.drops.where(:citizen_id=>key).first_or_initialize
              unless drop.users.exists?(current_user)
                drop.users << current_user
                raise drop.errors.inspect unless drop.valid?
                drop.save
              end
          end
        end
      end


      respond_to do |format|
        if @base_model.save
          format.html { redirect_to @base_model, notice: 'Selected drops were successfully created.' }
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
        @base_model = Citizen.find(params[:citizen_id])
        @results = Item.default_order.search_by_name(params[:q]).limit(15)
        unless @base_model.items.empty?
          @results = @results.where("ragnarok2_items.id NOT IN (?)", @base_model.items)
        end
      end
      if params[:item_id]
        @base_model = Item.find(params[:item_id])
        @results = Citizen.default_order.search_by_name(params[:q]).limit(15)
        unless @base_model.citizens.empty?
          @results = @results.where("ragnarok2_citizens.id NOT IN (?)", @base_model.citizens)
        end
      end

      respond_to do |format|
        format.js
        format.html {
          @drop = @base_model.drops.new
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

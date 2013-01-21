namespace :ragnarok2 do
  require 'RMagick'
  include Magick

  RAGNAROK2_ASSETS_DIR = {
    :icons => Rails.root.join('public', 'games', 'ro2', 'icons'),
    :maps => Rails.root.join('public', 'games', 'ro2', 'maps')
  }

  desc "Loads Mappers"
  task :load_mappers => :environment do

    m = DatabaseMapper.new("Ragnarok2::Translations::Quest", :partial=>true, :find_by=>:quest_id)

    m = DatabaseMapper.new("Ragnarok2::Translations::CitizenName", :partial=>true, :find_by=>:citizen_id)
    m.map_column("ID", "citizen_id")
    m.map_column("Name", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::CitizenJobName", :partial=>true, :find_by=>:citizen_id)
    m.map_column("ID", "citizen_id")
    m.map_column("Name", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::CitizenDescription", :partial=>true, :find_by=>:citizen_id)
    m.map_column("ID", "citizen_id")
    m.map_column("Name", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::ItemName", :partial=>true, :find_by=>:item_id)
    m.map_column("String_Item_Name", "item_id")
    m.map_column("name", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::ItemCategory", :partial=>true, :find_by=>:item_id)
    m.map_column("String_Item_Name", "item_id")
    m.map_column("Name", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::ItemDescription", :partial=>true, :find_by=>:item_id)
    m.map_column("String_Item_Description", "item_id")
    m.map_column("Description", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::JobName", :partial=>true, :find_by=>:job_id)
    m.map_column("String_ID", "job_id")
    m.map_column("String_Job_Name", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::ItemSet", :partial=>true, :find_by=>:item_set_id)
    m.map_column("String_Set_Name", "item_set_id")
    m.map_column("Name", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::TraitName", :partial=>true, :find_by=>:trait_id)
    m.map_column("MessageID", "trait_id")
    m.map_column("Message", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::SkillName", :partial=>true, :find_by=>:skill_id)
    m.map_column("String_ID", "skill_id")
    m.map_column("Skill_Name", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::KharaRewardTitle", :partial=>true, :find_by=>:title_id)
    m.map_column("ID", "title_id")
    m.loader = Proc.new {|entry, ientry|
      rtitle = Ragnarok2::Translations::KharaRewardTitle.where(:title_id=>entry[:title_id]).first_or_initialize

      #manually merge files into one table
      if entry[:name]
        rtitle.title = entry[:name]
      end
      if entry[:description]
        rtitle.description_long = entry[:description]
      end
      if entry[:detail_desc]
        rtitle.description_short = entry[:detail_desc]
      end

      if rtitle.save
        true
      else
        rtitle.destroy unless rtitle.new_record?
        false
      end
    }

    m = DatabaseMapper.new("Ragnarok2::KharaRewardTitle", :partial=>true, :find_by=>:title_id)
    m.map_column("ID", "title_id")
    m.map_column("Detail_Desc", "bonus_attributes")


    m = DatabaseMapper.new("Ragnarok2::Translations::SkillDescription", :partial=>true, :find_by=>:skill_id)
    m.map_column("String_ID", "skill_id")
    m.map_column("Skill_Description", "translation")

    m = DatabaseMapper.new("Ragnarok2::Translations::Khara", :partial=>true, :find_by=>:quest_id)
    m.map_column("Quest_Title", "title")
    m.map_column("SUMMARY_TEXT", "summary")

    m = DatabaseMapper.new("Ragnarok2::Quest", :partial=>true, :find_by=>:quest_id)
    m.map_column("Errpr_MSG_ID", "Error_MSG_ID") #corrent spelling

    m = DatabaseMapper.new("Ragnarok2::Citizen", :partial=>true, :find_by=>:citizen_id)
    m.map_column("ID", "citizen_id")
    m.map_column("Abil01", "ability_1")
    m.map_column("Abil02", "ability_2")
    m.map_column("Abil03", "ability_3")
    m.map_column("Abil04", "ability_4")
    m.map_column("Abil05", "ability_5")

    m = DatabaseMapper.new("Ragnarok2::Item", :partial=>true, :find_by=>:item_id)
    m.map_column("ID", "item_id")
    m.map_column("Name", "name_fallback")
    m.map_column("Default_Color", nil)
    m.map_column("high_category", "high_category_id")
    m.map_column("medium_category", "medium_category_id")
    m.map_column("low_category", "low_category_id")

    m = DatabaseMapper.new("Ragnarok2::ProJob", :partial=>true, :find_by=>:pro_job_id)
    m.map_column("ID", "pro_job_id")

    m = DatabaseMapper.new("Ragnarok2::ItemCategory", :partial=>true, :find_by=>:category_id)
    m.map_column("Index", "category_id")
    m.map_column("Name", "name_fallback")

    m = DatabaseMapper.new("Ragnarok2::Map", :partial=>true, :find_by=>:map_id)
    m.map_column("Map_Index", "map_id")
    m.map_column("Map_Name", "name")
    m.map_column("Map_ID", nil)
    m.map_column("Map_PK", "is_pk")
    m.map_column("Mount", "is_mount")
    m.map_column("Attack", "is_attack")
    m.map_column("Skill", "is_skill")
    m.map_column("Chat_Log", "is_chat_log")
    m.map_column("Map_Exp", "base_exp")

    m = DatabaseMapper.new("Ragnarok2::QuestInfo", :partial=>true, :find_by=>:quest_id)

    m = DatabaseMapper.new("Ragnarok2::MerchantInfo", :partial=>true, :find_by=>:entry_id)
    m.map_column("No", "entry_id")
    m.map_column("ID", "merchant_function_id")
    m.map_column("NPC_Name", nil)
    m.map_column("Item", "item_id")

    m = DatabaseMapper.new("Ragnarok2::BaseExp", :partial=>true, :find_by=>:base_level)

    m = DatabaseMapper.new("Ragnarok2::Dungeon", :partial=>true, :find_by=>:dungeon_id)
    m.map_column("DungeonID", "dungeon_id")
    m.map_column("DungeonGroupID", "dungeon_group_id")
    m.map_column("DungeonName", "name")
    m.map_column("Need_Quest_ID", "quest_id")

    m = DatabaseMapper.new("Ragnarok2::ItemSet", :partial=>false, :find_by=>:set_id) 
    m.map_column("Set_ID", "set_id")
    m.map_column("ItemID", "item_1_id")
    m.map_column("OrItemID", "item_2_id")
    m.map_column("String_Set_Name", "string_id")
    m.loader = Proc.new {|entry, ientry|

      itemset = Ragnarok2::ItemSet.where(:set_id=>entry[:set_id]).first_or_initialize
      itemset.string_id = entry[:string_id]

      #easiest way: delete all and add again:
      unless $setitems_initialised.include?(entry[:set_id])
        $setitems_initialised << entry[:set_id]
        itemset.set_items.destroy_all
      end

      association = itemset.set_items.build
      association.main_item = Ragnarok2::Item.where(:item_id=>entry[:item_1_id]).first
      association.alternative_item = Ragnarok2::Item.where(:item_id=>entry[:item_2_id]).first

      if itemset.save
        true
      else
        itemset.destroy unless itemset.new_record?
        false
      end
    }
    m.before_load = Proc.new {
      $setitems_initialised = []
    }

    m = DatabaseMapper.new("Ragnarok2::Trait", :partial=>true)
    m.map_column("ItemID", "item_id")
    m.map_column("Value", "trait_value1")
    m.map_column("Value2", "trait_value2")

    m = DatabaseMapper.new("Ragnarok2::SetTrait", :partial=>true, :delete_all=>true)
    m.map_column("Set_ID", "set_id")
    m.map_column("Value", "trait_value")
    m.map_column("Count", "amount")


    m = DatabaseMapper.new("Ragnarok2::ItemBreakInfo", :partial=>false)
    m.map_column("Item_ID", "item_id")
    m.map_column("StringNameID", nil)
    m.map_column("BreakResultID", "item_break_result_id")
    m.loader = Proc.new { |entry, ientry|
      if item = Ragnarok2::Item.where(:item_id=>entry[:item_id]).first
        item.item_break_result_id = entry[:item_break_result_id]
        item.save
      else
        false
      end
    }
    m.before_load = Proc.new {
      Ragnarok2::Item.update_all(:item_break_result_id=>nil)
    }

    m = DatabaseMapper.new("Ragnarok2::ItemBreakResult", :partial=>false, :delete_all=>true)
    m.map_column("Result_ID", "result_id")
    m.map_column("BreakGradeNum", "grade")
    m.map_column("BreakNeedItemID", "needed_item_id")
    m.map_column("BreakNeedItemNameID", nil)
    m.map_column("BreakNeedItemNum", "needed_item_amount")
    m.map_column("BreakResultItemID1", "result_item_1_id")
    m.map_column("BreakResultItemNameID1", nil)
    m.map_column("BreakResultItemNum1", "result_item_1_amount")
    m.map_column("BreakResultRate1", "result_item_1_rate")
    m.map_column("BreakResultItemID2", "result_item_2_id")
    m.map_column("BreakResultItemNameID2", nil)
    m.map_column("BreakResultItemNum2", "result_item_2_amount")
    m.map_column("BreakResultRate2", "result_item_2_rate")

    m = DatabaseMapper.new("Ragnarok2::SkillGroup", :partial=>true, :find_by=>:skill_group)
    m.map_column("Name", "name_fallback")

    m = DatabaseMapper.new("Ragnarok2::Skill", :partial=>true, :find_by=>:skill_id)
    m.map_column("ID", "skill_id")
    m.map_column("Name", "name_fallback")
    m.map_column("Skill_Group", "skill_group_id")

    m = DatabaseMapper.new("Ragnarok2::Job", :partial=>true, :find_by=>:job_id)
    m.map_column("ID", "job_id")
    m.map_column("Name", "name_fallback")

    m = DatabaseMapper.new("Ragnarok2::Khara", :partial=>true)
    m.map_column("Icon_Path", "icon")
    m.map_column("Errpr_MSG_ID", "error_msg_id")
    m.before_load = Proc.new {
      Ragnarok2::Khara.where(:quest_type=>0).delete_all
    }
    m.loader = Proc.new {|entry, ientry|
      #main-task, need to be preserved if possible
      unless entry[:quest_type].to_i.zero?
        task = Ragnarok2::Khara.where(:quest_id => entry[:quest_id]).where("quest_type != 0").first_or_initialize
        task.update_attributes(entry, :without_protection=>true)
      else #sub-task
        task = Ragnarok2::Khara.create
        task.update_attributes(entry, :without_protection=>true)
      end

      task.save ? true : false
    }

    m = DatabaseMapper.new("Ragnarok2::KharaTitle", :partial=>true, :find_by=>:title_id)

    m = DatabaseMapper.new("Ragnarok2::ItemCashInfo", :partial=>true, :find_by=>:item_id)
    m.map_column("ItemStringName", nil)
    m.map_column("ItemDescription", nil)
    m.map_column("Contents_Type", "content_type")
    m.map_column("Duration_Time", "duration_value")
    m.map_column("Cash_Icon", nil)
    m.map_column("DurationExtend_GroupID", "duration_extend_group_id")
  end


  ############

  desc "Performs a full update (without extraction of game files)"
  task :update => [:dds, :tbl, :ct] do
    puts "Update successfully run."
  end

  desc "Performs a full update"
  task :update_with_extract => [:vdk, :dds, :tbl, :ct] do
    puts "Update successfully run."
  end

  desc "Extracts *.vdk client files"
  task :vdk do
    Dir.glob(Rails.root.join('share', 'gameclients', 'ro2', '*.VDK')) do |src|
      dest = Rails.root.join('share', 'gameclients', 'ro2', 'extracted')
      vdk = VDKUnpacker.new(src, dest)
      vdk.unpack!
    end
  end

  desc "Reading *.tbl files"
  task :tbl => [:load_mappers, :environment] do

    [
      ["String_Title_Name.tbl", "Ragnarok2::Translations::KharaRewardTitle"], #before String_Title_Detail_Desc, String_Title_Description
      ["String_Title_Description.tbl", "Ragnarok2::Translations::KharaRewardTitle"],
      ["String_Title_Detail_Desc.tbl", "Ragnarok2::Translations::KharaRewardTitle"],
      ["String_Title_Detail_Desc.tbl", "Ragnarok2::KharaRewardTitle"],
      ["string_Khara_text.tbl", "Ragnarok2::Translations::Khara"],
      ["String_Skill_Name.tbl", "Ragnarok2::Translations::SkillName"],
      ["String_Skill_Description.tbl", "Ragnarok2::Translations::SkillDescription"],
      ["String_TraitName.tbl", "Ragnarok2::Translations::TraitName"],
      ["String_Set_Name.tbl", "Ragnarok2::Translations::ItemSet"],
      ["string_job_name.tbl", "Ragnarok2::Translations::JobName"],
      ["string_item_description.tbl", "Ragnarok2::Translations::ItemDescription"],
      ["string_item_name.tbl", "Ragnarok2::Translations::ItemName"],
      ["String_Item_Category.tbl", "Ragnarok2::Translations::ItemCategory"],
      ["string_quest_text.tbl", "Ragnarok2::Translations::Quest"],
      ["string_npc_name.tbl", "Ragnarok2::Translations::CitizenName"],
      ["string_npc_job_name.tbl", "Ragnarok2::Translations::CitizenJobName"],
      ["string_npc_description.tbl", "Ragnarok2::Translations::CitizenDescription"]
    ].each do |file, class_name|

      file = FileExtractor_tbl.new(Rails.root.join('share', 'gameclients', 'ro2', 'extracted', 'ASSET', 'LANG', '65', 'STRING', file))

      mapper = DatabaseMapper.find(
        :header => file.header,
        :class_name => class_name
      )

      mapper.load(file.data)
    end
  end

  desc "Reading *.ct files"
  task :ct => [:load_mappers, :environment] do

    [
      #["DungeonMission.ct", ""],
      #["TokenName.ct", ""], #depricated?
      #["TokenFile.ct", ""], #depricated?
      ["ItemCashInfo.ct", "Ragnarok2::ItemCashInfo"],
      ["KHARA_Title_Info.ct", "Ragnarok2::KharaTitle"],
      ["Khara_Info.ct", "Ragnarok2::Khara"],
      ["JobInfo.ct", "Ragnarok2::Job"],
      ["Skill_Table_SkillLevel.ct", "Ragnarok2::Skill"],
      ["Skill_Table_Base.ct", "Ragnarok2::SkillGroup"],
      ["SetTrait.ct", "Ragnarok2::SetTrait"], #before itemset
      ["TraitInfo.ct", "Ragnarok2::Trait", :delete_all=>true], #before items, before trait-part1
      ["TraitInfo2.ct", "Ragnarok2::Trait"], #before items
      ["BaseExpTable.ct", "Ragnarok2::BaseExp"],
      ["ProJob_Type.ct", "Ragnarok2::ProJob"],
      ["Map_List.ct", "Ragnarok2::Map"], #before dungeon
      ["Merchant.ct", "Ragnarok2::MerchantInfo"], #before citizen
      ["itemcategory.ct", "Ragnarok2::ItemCategory"], #before item
      ["ItemInfo.ct", "Ragnarok2::Item"], #before quests, citizen, itemset, itembreakinfo, breakresult
      ["NPCInfo.ct", "Ragnarok2::Citizen"], #before quests
      ["Quest_Help_Info.ct", "Ragnarok2::QuestInfo"],
      ["Quest_Info.ct", "Ragnarok2::Quest"],
      ["SetItem.ct", "Ragnarok2::ItemSet"],
      ["DungeonInfo.ct", "Ragnarok2::Dungeon"],
      ["ItemBreakInfo.ct", "Ragnarok2::ItemBreakInfo"],
      ["BreakResult.ct", "Ragnarok2::ItemBreakResult"]
    ].each do |file, class_name, opts|

      file = FileExtractor_ct.new(Rails.root.join('share', 'gameclients', 'ro2', 'extracted', 'ASSET', 'ASSET', file))

      mapper = DatabaseMapper.find(
        :header => file.header,
        :class_name => class_name
      )

      mapper.load(file.data, opts)
    end
  end

  desc "Search through ct files to find a value"
  task :search_ct => [:environment] do
    search_value = "30000059"
    Dir.glob(Rails.root.join('share', 'gameclients', 'ro2', 'extracted', 'ASSET', 'ASSET', "*.ct")).sort.each do |file|

      ext = FileExtractor_ct.new(file)
      puts file if ext.data.flatten.collect{|v| v.to_s}.include?(search_value)
    end
=begin
    Dir.glob(Rails.root.join('share', 'gameclients', 'ro2', 'extracted', '**', "*.ct")).each do |file|
      begin
        file = FileExtractor_ct.new(file, :debug=>true)
      rescue
        puts "ERROR: #{file}: #{$!}"
      end
    end
=end
  end

  desc "Reads and converts *.dds icons to png"
  task :dds_icons do
    puts "Converting *.dds icon files..."

    dds_files = Dir.glob(Rails.root.join('share', 'gameclients', 'ro2', 'extracted', 'UI', 'UI', 'icon', '**', "*.dds"))
    dds_files.each_with_index do |dds, index|
      dds_to_png(dds, RAGNAROK2_ASSETS_DIR[:icons])
      print "> Done #{index+1}/#{dds_files.count}\r"
    end
    puts
  end


  desc "Reads and converts *.dds maps to png"
  task :dds_maps do
    puts "Converting *.dds map files..."

    dds_files = Dir.glob(Rails.root.join('share', 'gameclients', 'ro2', 'extracted', 'UI', 'LANG', '65', 'map', "*.dds"))
    dds_files.each_with_index do |dds, index|
      dds_to_png(dds, RAGNAROK2_ASSETS_DIR[:maps])
      print "> Done #{index+1}/#{dds_files.count}\r"
    end
  end

  desc "Reads and converts all *.dss files"
  task :dds => [:dds_icons, :dds_maps] do
  end
end


def dds_to_png(src, dest)
  FileUtils.mkdir_p(dest) #create directory if not present
  begin
    name = File.basename(src, ".dds")
    icon = Image.read(src).first
    icon.write("#{dest}/#{name.downcase}.png")
    true
  rescue
    puts "Ignored #{src}: #{$!}"
    false
  end
end


class DatabaseMapper
  NO_CHANGE = true
  @@mapper = {}

  attr_accessor :loader, :before_load, :after_load

  def initialize(class_name, opts={}, &block)
    @model_name = class_name
    begin 
      @model_instance = class_name.constantize
    rescue
      @model_instance = nil
    end
    @table_header = []
    @settings = {
      #if set, only columns which should be handles specific need to be specified.
      #other columns will be added automatically with NO_CHANGE
      :partial => false,
      :show_invalids => false
    }.merge(opts)
    @loader = block
    @@mapper[class_name] = self
  end

  def self.find(opts)
    unless @mapper = @@mapper[opts[:class_name]]
      raise "#{opts[:class_name]}: No mapper found"
    end
    unless @mapper.valid_header?(opts[:header])
      raise "#{opts[:class_name]}: Invalid header" 
    end

    @mapper
  end

  def load(datasets, opts={})
    settings = @settings.merge(opts || {})

    puts "#{@model_name}"
    raise "Datasets need to be an array" unless Array.try_convert(datasets)
    hashed_datasets = self.map_datasets(datasets)
    ignored = 0

    @model_instance.delete_all if settings[:delete_all] && @model_instance
    @before_load.call if @before_load
    hashed_datasets.each_with_index do |entry, ientry|
      #puts "#{entry}\n"
      unless @loader
        if !settings[:find_by]
          e = @model_instance.create
        else 
          e = @model_instance.where(settings[:find_by]=>entry[settings[:find_by]]).first_or_initialize
        end
        
        if !e.update_attributes(entry, :without_protection => true)
          ignored += 1
          e.destroy unless e.new_record?
          if settings[:show_invalids]
            p entry
            puts
          end
        elsif settings[:find_by]==:id
          #cruel workaround to set ID manually
          @model_instance.update_all("id = #{entry[:id]}", "id = #{e.id}")
        end
      else
        ignored += 1 unless @loader.call(entry, ientry)
      end
      print "> Done #{ientry+1}/#{hashed_datasets.count} (#{ignored} invalid)\r"
    end
    puts
    @after_load.call if @after_load
  end

  def valid_header?(header)
    unless @settings[:partial]
      #1:1 check if not partial selected
      oldcolumns = @table_header.collect{|s| s.first }
      unless oldcolumns == header
        puts "Headers changed (used 1:1 matching)"
        puts "Add: #{header - oldcolumns}"
        puts "Del: #{oldcolumns - header}"
        return false
      end
    else
      return merge_partial_header(header)
    end
    true
  end

  def merge_partial_header(header)
    @table_header_full = []
    partial_pointer = 0
    header.each do |src_column|
      if @table_header[partial_pointer] && src_column == @table_header[partial_pointer][0]
        @table_header_full << @table_header[partial_pointer]
        partial_pointer += 1
        next
      end
      #columns do not match, use NO_CHANGE and step forward
      @table_header_full << [src_column, src_column.downcase]
    end
    #if we have any columns left, there is something wrong
    if partial_pointer < @table_header.length
        puts "Headers changed (used partial auto-building)"
        puts "Partials left: #{@table_header[partial_pointer..-1]}"
      return false
    end
    return true
  end

  def map_column(src_column, dest_column)
    dest_column = src_column.dup if dest_column === DatabaseMapper::NO_CHANGE
    dest_column.downcase! if dest_column #columns should be always lower-case
    @table_header << [src_column, dest_column]
  end

  def map_datasets(datasets)
    raise "Datasets need to be an array" unless Array.try_convert(datasets)
    hashed_datasets = []

    header = @table_header_full || @table_header

    datasets.each do |dataset|
      hashed_dataset = {}
      header.each_with_index do |column, icolumn|
        hashed_dataset[column[1].to_sym] = dataset[icolumn] unless column[1].blank? #ignore columns which maps to nil
      end
      hashed_datasets << hashed_dataset
    end
    hashed_datasets
  end
end


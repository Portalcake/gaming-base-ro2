module Ragnarok2
  class ItemSocketGroup < ActiveRecord::Base
    validates :socket_group_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    before_save :update_icon_names

    def sockets
      s = []
      1.upto 5 do |i|
        next unless self.send("open_icon#{i}") && !self.send("string_socket_name#{i}").zero?
        s << Socket.new(
              :open=>self.send("open_icon#{i}"), 
              :close=>self.send("close_icon#{i}"),
              :type=>self.send("socket_type#{i}"),
              :name=>self.send("string_socket_name#{i}")
            )
      end
      s
    end

    private
    def update_icon_names
      ["open", "close"].each do |type|
        1.upto 5 do |i|
          next unless self.send("#{type}_icon#{i}_changed?")
          name = self.send("#{type}_icon#{i}").scan(/[^\\\/]+\.dds/).first
          name = name.gsub(".dds", "").downcase if name
          self["#{type}_icon#{i}"] = name
        end
      end
    end


    class Socket
      attr_reader :icon_open, :icon_close, :name, :socket_type
      def initialize(opts)
        @icon_open = opts[:open]
        @icon_close = opts[:close]
        @socket_type = opts[:type]
        @name = opts[:name]
      end

    end
  end
end

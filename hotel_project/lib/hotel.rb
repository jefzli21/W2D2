require_relative "room"

class Hotel
  
    def initialize (name,capacities)
    
        @name = name
        @rooms = {}

        capacities.each do |room_names, capacity|
            @rooms[room_names] = Room.new(capacity)
        end

    
    end

    def name
        new = []
        @name.split(" ").each do |i|
            n = i[0].upcase + i[1..-1]
            new << n
        end
        new.join(" ")
    end

    def rooms
    
        @rooms
    
    end

    def room_exists?(room)
        if @rooms.has_key?(room)
            return true
        else
            return false
        end
    end

    def check_in(person,room)
        if room_exists?(room) == false
            puts 'sorry, room does not exist'
            return false
        elsif room_exists?(room) == true
            if @rooms[room].add_occupant(person)
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
        end
    
        
    end

    def has_vacancy?
    
        @rooms.values.each do |i|
            if i.available_space > 0
                return true
            elsif i.available_space == 0
                return false
            end
        
        end
    
    end

    def list_rooms
    
        @rooms.each do |keys,values|
            puts keys + values.available_space.to_s
        end
    
    end




end

class Room

    attr_reader :capacity , :occupants

    def initialize(capacity)
        
        @capacity = capacity
        @occupants = []
        
    end
  
    def full?
        if @occupants.length < @capacity
            false
        else
            true
            end
    end

    def available_space
        space = @capacity - @occupants.length
        space
    end

    def add_occupant(name)
        if self.full? == false   #@occupants.length < @capacity
            @occupants << name
            return true
        else
            return false
        end
    
    end
end
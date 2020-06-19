class Journey 
    attr_reader :entry_station ,:complete 
    PENALTY_FARE = 6
    TRAVEL_FARE = 3
    def initialize(entry_station = nil)
        @entry_station = entry_station
        @complete = false
    end 
    
    def finish 
        @complete = true
    end 
    
    def fare
        if @entry_station == nil || @complete == false 
            PENALTY_FARE
        else 
            TRAVEL_FARE
        end 
            
    end 
    
end 
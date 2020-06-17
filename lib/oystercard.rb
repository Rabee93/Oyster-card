class Oystercard
    attr_reader :balance, :entry_station
    MAX_BALANCE = 90
    MIN_BALANCE = 1

    def initialize
        @balance = 0
    end

    def top_up(amount)
      fail 'exceeded balance' if (@balance + amount) > MAX_BALANCE
      @balance += amount
    end
    
      private 
      
    def deduct(fare)
      @balance -= fare
    end
     
     public 

    def in_journey?
      if @entry_station == nil
        false
      else
        true
      end
    end

    def touch_in(station)
      fail 'low balance' if @balance <= MIN_BALANCE
      @entry_station = station
      @in_journey = true
    end

    def touch_out
      @in_journey = false
      @entry_station = nil
    end
    
    def history
      "Kings Cross"
    end 

end 


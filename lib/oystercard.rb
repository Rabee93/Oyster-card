class Oystercard
<<<<<<< HEAD
    attr_reader :balance, :entry_station, :exit_station, :journeys, :journey
=======
    attr_reader :balance, :entry_station
>>>>>>> 30630e6198edab4d9deb37ac0370f3ceda2d2a82
    MAX_BALANCE = 90
    MIN_BALANCE = 1

    def initialize
        @balance = 0
<<<<<<< HEAD
        @journeys = []
=======
>>>>>>> 30630e6198edab4d9deb37ac0370f3ceda2d2a82
    end

    def top_up(amount)
      fail 'exceeded balance' if (@balance + amount) > MAX_BALANCE
      @balance += amount
    end

    def in_journey?
<<<<<<< HEAD
      !!@entry_station
    end

    def touch_in(entry_station)
      fail 'low balance' if @balance <= MIN_BALANCE
      @entry_station = entry_station
    end

    def touch_out(exit_station)
      deduct(MIN_BALANCE)
      #@balance -= MIN_BALANCE
     @exit_station = exit_station
      @journey = {@entry_station => @exit_station}
      @entry_station = nil
    end
    
    private
    
    def deduct(fare)
      @balance -= fare
    end
=======
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

>>>>>>> 30630e6198edab4d9deb37ac0370f3ceda2d2a82
end 
    



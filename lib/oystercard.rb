class Oystercard
    attr_reader :balance, :entry_station, :exit_station, :journeys, :journey
    MAX_BALANCE = 90
    MIN_BALANCE = 1

    def initialize
        @balance = 0
        @journeys = []
    end

    def top_up(amount)
      fail 'exceeded balance' if (@balance + amount) > MAX_BALANCE
      @balance += amount
    end

    def in_journey?
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
end 
    



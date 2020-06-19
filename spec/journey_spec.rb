require 'journey'

describe Journey do 
    let(:journey) {Journey.new}
    describe"initialize" do 
        it' starts the journey with nil entry station' do 
          expect(journey.entry_station).to eq(nil)
        end 
        it'journey did not start yet' do 
            expect(journey.complete).to eq(false)
        end 
    end 
    describe'complete' do 
        it'journey has finished' do 
          journey.finish
          expect(journey.complete).to eq(true)
        end 
    end 
    describe'#fare' do 
      it 'charges travel fare' do 
        journey = Journey.new("north acton")
        journey.finish 
        expect(journey.fare).to eq(3)
      end 
      it'charges penatly fare for not touching in' do 
          journey.finish 
          expect(journey.fare).to eq(6)
        end 
      it 'charges penatly fare for not touching out' do 
          journey = Journey.new("Angel")
          expect(journey.fare).to eq(6)
      end 
    end 
end   
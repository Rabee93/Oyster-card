require 'oystercard'

describe Oystercard do
  let(:oystercard) {Oystercard.new}
<<<<<<< HEAD
  let(:entry_station) {double 'station'}
  let(:exit_station) {double 'station'}
    describe 'initialize' do
        it 'can create an instance of oystercard' do
            expect(oystercard).to be_an_instance_of(Oystercard)
        end
        it 'should create journeys as an array' do
          expect(oystercard.journeys).to be_an_instance_of(Array)
        end 
        it 'should have no journeys when a new oystercard is created' do
          expect(oystercard.journeys).to be_empty
        end 
=======
  let(:station) { "Kings Cross" }
  
    describe 'initialize' do
      it 'can create an instance of oystercard' do
        card = Oystercard.new
        expect(card).to be_an_instance_of(Oystercard)
      end

      it 'can create a zero balance' do
        card = Oystercard.new
        expect(card.balance).to eq(0)
      end
>>>>>>> 30630e6198edab4d9deb37ac0370f3ceda2d2a82
    end


    describe '#balance' do
      it 'checks balance' do
        
        expect(oystercard.balance).to eq(0)
      end
    end

     describe '#top_up' do
     # it { is_expected.to respond_to(:top_up).with(1).argument }
      #it 'can top up the balance' do
      #expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      #end
      it 'adds money to the balance' do
        
        oystercard.top_up(3)
        expect { oystercard.top_up(3) }.to change { oystercard.balance }.by(3)
      end
      it 'raises an error if the balance exceeds 90' do
        
        max_balance = Oystercard::MAX_BALANCE
        oystercard.top_up(max_balance)
        expect { oystercard.top_up(1) }.to raise_error 'exceeded balance'
      end
    end

    describe '#deduct' do
      it 'deducts the fare from the balance' do
        
        oystercard.send(:deduct, 3)
        expect{ oystercard.send(:deduct, 2) }.to change { oystercard.balance }.by(-2)
      end
    end

    describe 'in_journey' do
      it 'is initially not in a journey' do
        expect(subject).not_to be_in_journey
      end
    end


    describe '#touch_in' do
      it 'in_journey will be true when touched in' do
        oystercard.top_up(10)
<<<<<<< HEAD
        oystercard.touch_in(entry_station)
        expect(oystercard.in_journey?).to eq(true)
        #expect(oystercard).to be_in_journey
      end
      it { is_expected.to respond_to(:touch_in).with(1).argument }
=======
        oystercard.touch_in(station)
        expect(oystercard.in_journey?).to eq(true)
        #expect(oystercard).to be_in_journey
      end

      it 'will accept an entry station as an argument' do
        oystercard.top_up(10)
        expect(oystercard).to respond_to(:touch_in).with(1).argument
      end

>>>>>>> 30630e6198edab4d9deb37ac0370f3ceda2d2a82
      it 'if low balance cant touch in' do
        
        #min_balance = Oystercard::MIN_BALANCE
        #ystercard.touch_in
        @balance = 0
        #oystercard.deduct(10)
<<<<<<< HEAD
        expect{ oystercard.touch_in(entry_station) }.to raise_error 'low balance'
=======
        expect{ oystercard.touch_in(station) }.to raise_error 'low balance'
>>>>>>> 30630e6198edab4d9deb37ac0370f3ceda2d2a82
      end
      it 'stores the entry station as an argument' do
        oystercard.top_up(3)
        oystercard.touch_in(entry_station)
        expect(oystercard.entry_station).to eq(entry_station)
      end 
    end

    describe '#touch_out' do
      it 'in_journey will be false when touched out' do
        oystercard.top_up(3)
<<<<<<< HEAD
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        #expect(oystercard.in_journey).to eq(false)
        expect(subject).not_to be_in_journey
      end
      it { is_expected.to respond_to(:touch_out).with(1).argument }
      it 'entry_station is reste to nil after touch_out' do
        oystercard.top_up(3)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.entry_station).to eq(nil)
      end 
      it 'store the exit station that we touched out at' do
        oystercard.top_up(3)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.exit_station).to eq(exit_station)
      end 
    end
     describe '#journey' do 
      it 'will show one journey' do
        oystercard.top_up(3)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.journey).to eq(entry_station => exit_station)
=======
        oystercard.touch_in(station)
        oystercard.touch_out
        #expect(oystercard.in_journey).to eq(false)
        expect(subject).not_to be_in_journey
      end

      it 'will clear entry station on touch out' do
        oystercard.top_up(3)
        oystercard.touch_in(station)
        oystercard.touch_out
        expect(oystercard.entry_station).to eq(nil)
      end
    end
    describe "#history" do
      it'shows last journy station' do 
        oystercard.top_up(3)
        oystercard.touch_in(station)
        oystercard.touch_out
        expect(oystercard).to respond_to(:history)
      end 
      it 'shows us the last station we touched in at' do
        oystercard.top_up(3)
        oystercard.touch_in(station)
        # oystercard.touch_out
        expect(oystercard.history).to eq(station)
>>>>>>> 30630e6198edab4d9deb37ac0370f3ceda2d2a82
      end 
    end 

    describe "#entry_station" do
      it 'will remember the station touched in at' do
        oystercard.top_up(3)
        oystercard.touch_in(station)
        # oystercard.touch_out
        expect(oystercard.entry_station).to eq(station)
      end

    end
  
  end
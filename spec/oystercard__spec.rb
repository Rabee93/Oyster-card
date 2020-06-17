require 'oystercard'

describe Oystercard do
  let(:oystercard) {Oystercard.new}
  
    describe 'initialize' do
        it 'can create an instance of oystercard' do
            expect(oystercard).to be_an_instance_of(Oystercard)
        end
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
        oystercard.touch_in
        expect(oystercard.in_journey).to eq(true)
        #expect(oystercard).to be_in_journey
      end
      it 'if low balance cant touch in' do
        
        #min_balance = Oystercard::MIN_BALANCE
        #ystercard.touch_in
        @balance = 0
        #oystercard.deduct(10)
        expect{ oystercard.touch_in }.to raise_error 'low balance'
      end
    end

    describe '#touch_out' do
      it 'in_journey will be false when touched out' do

        oystercard.top_up(3)
        oystercard.touch_in
        oystercard.touch_out
        #expect(oystercard.in_journey).to eq(false)
        expect(subject).not_to be_in_journey
      end
    end
    describe "#history" do
      it'shows last journy station' do 
        oystercard.top_up(3)
        oystercard.touch_in
        oystercard.touch_out
        expect(oystercard).to respond_to(:history)
      end 
      it 'shows us the last station we touched in at' do
        station = ("Kings cross")
        oystercard.top_up(3)
        oystercard.touch_in
        oystercard.touch_out
        expect(oystercard.history).to eq(station)
      end 
    end 
  end
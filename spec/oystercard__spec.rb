require 'oystercard'

describe Oystercard do 
    describe 'initialize' do 
      it 'initializes balance under oystercard class' do 
        oystercard = Oystercard.new
        expect(oystercard.balance).to eq(0)
       end 
    end 
    describe '#top_up' do 
      it 'adds money to the balance' do
        oystercard = Oystercard.new
        oystercard.top_up(3)
        expect { oystercard.top_up(3) }.to change { oystercard.balance }.by(3)
      end 
      it 'raises an error if the balance exceeds 90' do
        oystercard = Oystercard.new
        max_balance = Oystercard::MAX_BALANCE
        oystercard.top_up(max_balance)
        expect { oystercard.top_up(1) }.to raise_error 'exceeded balance'
      end 
    end 
 end 
require 'rspec'
require 'deck'

describe Deck do

  describe '#setup' do
    subject(:deck) { Deck.new }
    it 'should create and array of 52 cards' do
      expect(deck.cards.length).to eq(52)
    end


    it 'should not create any duplicate cards' do
      expect(deck.cards.map(&:card_value).uniq.count).to eq(52)
    end

  end

  describe '#shuffle' do
    let(:deck1) { Deck.new }


    # Ask ryan how to do this better.
    it "should return a deck that isn't the same as setup" do
      pre_shuffle = deck1.cards
      expect(deck1.shuffle == pre_shuffle).to be_false
    end


  end

  describe '#deal'  do

    it "should deal one card"

  end



end

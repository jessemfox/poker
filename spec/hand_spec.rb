require 'rspec'
require 'hand'


describe Hand do


  describe 'setup of a hand' do
    subject(:hand) { Hand.new }

    it 'should have no cards ' do
      expect(hand.cards).to eq([])
    end

  end



  describe 'test for the highest card' do

    subject(:hand) { Hand.new  }
    let(:cards) do [Card.new(6, "S"), Card.new(5, "S"),
                   Card.new(8, "H"), Card.new(1, "D"),
                   Card.new(11, "H")]
    end


    it 'finds the highest card' do
      hand.cards = cards
      expect(hand.best_value).to eq([0, 11, 8, 6, 5, 1])
    end
  end

  describe 'test for one pair' do
    subject(:hand) { Hand.new  }
    let(:cards) do [Card.new(6, "S"), Card.new(5, "S"),
                   Card.new(8, "H"), Card.new(5, "D"),
                   Card.new(12, "H")]
    end

    it 'should find a pair of cards' do
      hand.cards = cards
      expect(hand.best_value).to eq([1, 5, 12, 8, 6])
    end
  end

  describe 'test for two pairs' do
    subject(:hand) { Hand.new  }
    let(:cards) do [Card.new(6, "S"), Card.new(5, "S"),
                   Card.new(12, "H"), Card.new(5, "D"),
                   Card.new(12, "H")]
    end

    it "should find two pair" do
      hand.cards = cards
      expect(hand.best_value).to eq([2, 12, 5, 6])
    end

  end

  describe 'test for three of a kind' do
    subject(:hand) { Hand.new  }
    let(:cards) do [Card.new(6, "S"), Card.new(5, "S"),
                   Card.new(8, "H"), Card.new(5, "D"),
                   Card.new(5, "H")]
    end

    it 'should find three of a kind' do
      hand.cards = cards
      expect(hand.best_value).to eq([3, 5])
    end
  end

  describe 'test for a straight' do
    subject(:hand) { Hand.new  }
    let(:cards) do [Card.new(6, "S"), Card.new(7, "S"),
                   Card.new(8, "H"), Card.new(9, "D"),
                   Card.new(5, "H")]
    end

    it 'should find a staright' do
      hand.cards = cards
      expect(hand.best_value).to eq([4, 9])
    end
  end

  describe 'test for a flush' do
    subject(:hand) { Hand.new  }
    let(:cards) do [Card.new(2, "H"), Card.new(7, "H"),
                   Card.new(8, "H"), Card.new(9, "H"),
                   Card.new(5, "H")]
    end

    it 'should find a flush' do
      hand.cards = cards
      expect(hand.best_value).to eq([5, 9, 8, 7, 5, 2])
    end
  end

  describe 'test for a full house' do
    subject(:hand) { Hand.new  }
    let(:cards) do [Card.new(8, "D"), Card.new(5, "H"),
                   Card.new(8, "H"), Card.new(5, "S"),
                   Card.new(5, "C")]
    end

    it 'should find a full house' do
      hand.cards = cards
      expect(hand.best_value).to eq([6, 5, 8])
    end
  end

  describe 'test for four of a kind' do
    subject(:hand) { Hand.new  }
    let(:cards) do [Card.new(8, "H"), Card.new(5, "D"),
                   Card.new(5, "H"), Card.new(5, "S"),
                   Card.new(5, "C")]
    end

    it 'should find four of a kind' do
      hand.cards = cards
      expect(hand.best_value).to eq([7, 5])
    end
  end

  describe 'test for straight flush' do
    subject(:hand) { Hand.new  }
    let(:cards) do [Card.new(1, "H"), Card.new(4, "H"),
                   Card.new(2, "H"), Card.new(5, "H"),
                   Card.new(3, "H")]
    end

    it 'should find a straight flush' do
      hand.cards = cards
      expect(hand.best_value).to eq([8, 5])
    end
  end


end
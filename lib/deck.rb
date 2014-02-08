require_relative 'card'

class Deck

  CARD_ORDER = {
    0 => '2',
    1 => '3',
    2 => '4',
    3 => '5',
    4 => '6',
    5 => '7',
    6 => '8',
    7 => '9',
    8 => '10',
    9 =>  'J',
    10 => 'Q',
    11 => 'K',
    12 => 'A'
  }

  SUITS = ['S', 'C', 'H', 'D']

  attr_reader :cards

  def initialize
    @cards = setup
  end

  def setup
    cards = []
    CARD_ORDER.keys.each do |card|
      SUITS.each do |suit|
        cards << Card.new(card, suit)
      end
    end
    cards
  end

  def shuffle
    @cards.shuffle
    self
  end

end
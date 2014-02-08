require_relative 'deck'
class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value, @suit = value, suit
  end

  def card_value
    "#{Deck::CARD_ORDER[@value]}#{@suit}"
  end

end
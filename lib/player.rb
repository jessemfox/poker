require_relative 'hand'

class Player
  attr_accessor :pot, :hand

  def initialize
    @pot = 100
    @hand = Hand.new
  end

  def bet
      bet = Integer(gets.chomp)
      @pot -= bet
      bet
  end

  def discard_cards
    discard = gets.chomp.split(" ").map(&:to_i)
    discard.each do |num|
      @hand.cards[num] = nil
    end
    @hand.cards.compact!
    discard.length
  end


end
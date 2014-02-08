require_relative 'deck'

class Hand

  HAND_ORDERS =   [:high_card, :pair, :two_pair, :three_of_a_kind, :straight, :flush,
                  :full_house, :four_of_a_kind, :straight_flush]

  attr_accessor :cards
  def initialize
    @cards = []
  end

  def best_value
    score_my_hand

  end

  def tie_breaker(another_hand)
    # self vs. another hand.

  end


  private



  def score_my_hand
    HAND_ORDERS.reverse.each do |hand|
      return self.send(hand) if self.send(hand)
    end
  end



  def high_card
    max = 0
    @cards.each do |card|
      max = card.value if card.value > max
    end
    [HAND_ORDERS.index(:high_card), ordered_cards].flatten
  end

  def pair
    count_cards = map_vals
    cards = ordered_cards
    pair = count_cards.select { |card, count| count > 1 }
    if pair.empty?
      false
    else
      cards.delete_if { |card| card == pair.keys[0] }
      [HAND_ORDERS.index(:pair), pair.keys[0], cards].flatten
    end
  end

  def two_pair
    count_cards = map_vals
    cards = ordered_cards
    pair = count_cards.select { |card, count| count > 1 }
    if pair.count < 2
      false
    else
      cards.delete_if { |card| card == pair.keys.max || card == pair.keys.min }
      [HAND_ORDERS.index(:two_pair), pair.keys.max, pair.keys.min, cards].flatten
    end
  end

  def three_of_a_kind
    count_cards = map_vals
    pair = count_cards.select { |card, count| count > 2 }
    if pair.empty?
      false
    else
      [HAND_ORDERS.index(:three_of_a_kind), pair.keys.first]
    end
  end

  def straight
    ordered_cards = self.cards.map(&:value).sort
    count_cards = map_vals

    if count_cards.keys.count == 5 && (ordered_cards[-1] - ordered_cards[0]) == 4
      [HAND_ORDERS.index(:straight), ordered_cards[-1]]
    else
      false
    end
  end

  def flush
    if has_flush?
      [HAND_ORDERS.index(:flush), ordered_cards].flatten
    else
      false
    end
  end

  def full_house
    count_cards = map_vals
    triple = count_cards.select { |card, count| count == 3 }
    pair = count_cards.select { |card, count| count == 2 }
    if triple.empty? || pair.empty?
      false
    else
      [HAND_ORDERS.index(:full_house), triple.keys.first, pair.keys.first]
    end
  end

  def four_of_a_kind
    count_cards = map_vals
    quad = count_cards.select { |card, count| count == 4 }

    if quad.empty?
      return false
    else
      [HAND_ORDERS.index(:four_of_a_kind), quad.keys.first]
    end
  end

  def straight_flush
    if has_flush? && has_straight?
      [HAND_ORDERS.index(:straight_flush), ordered_cards.first]
    else
      false
    end

  end

  def map_vals
    values = @cards.map { |card| card.value}
    count_cards = Hash.new {|h, k| h[k] = 0}
    values.each do |val|
      count_cards[val] += 1
    end
    count_cards
  end

  def map_suits
    suits = @cards.map { |card| card.suit}
    count_suits = Hash.new {|h, k| h[k] = 0}
    suits.each do |suit|
      count_suits[suit] += 1
    end
    count_suits
  end

  def ordered_cards
    self.cards.map(&:value).sort.reverse
  end

  def has_flush?
    count_suits = map_suits
    count_suits.keys.length == 1
  end

  def has_straight?
    count_cards = map_vals
    count_cards.keys.count == 5 && ((ordered_cards[0] - ordered_cards[-1]) == 4 )
  end

end
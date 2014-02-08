require_relative 'player'

class Game
  attr_accessor :pot, :turn
  attr_reader :players, :deck
  def initialize(*players)
    @players = set_up_players_hash(players)
    @deck = Deck.new.shuffle
    @pot = 0
    @turn = 1
  end

  def set_up_players_hash(players)
    player_hash = {}

    1.upto(players.count) do |num|
      player_hash[num] = players[num - 1]
    end

    player_hash

  end

  def deal_card(player)
    player.hand.cards << @deck.cards.pop
  end

  def get_bet_from_player(player)
    bet = player.bet
    @pot += bet
    bet
  end







end




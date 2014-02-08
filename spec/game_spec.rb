require 'rspec'
require 'game'


describe Game do

  let(:game) { Game.new(Player.new, Player.new, Player.new) }

  it "should have players" do
    expect(game.players.count).to eq(3)
  end

  it "should actually have real players" do
    expect(game.players.values.all?{ |player| player.is_a? Player }).to be_true
  end

  it "should have a pot" do
    expect(game.pot).to eq(0)
  end

  it 'should have a turn counter' do
    expect(game.turn).to eq(1)
  end

  it "should have a deck" do
    expect(game.deck.is_a? Deck).to be_true
  end

  it "should deal one card to a player" do
    first_player = game.players.values.first
    first_player_hand = first_player.hand.cards
    game.deal_card(first_player)
    expect(first_player_hand.count).to eq(1)
  end

  context "when betting" do
    let(:player) { double("Player", :bet => 10) }
    subject(:game) { Game.new(player) }


    it "should get a bet froma a player" do
      expect(game.get_bet_from_player(player)).to eq(10)
      expect(game.pot).to eq(10)
    end
  end
end
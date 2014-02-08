require 'rspec'
require 'player'
require 'hand'


describe Player do

  let(:player) { Player.new }

  it "has a pot" do
    expect(player.pot).to eq(100)
  end

  # it "has a hand of  five cards" do
 #    expect(player.hand.count).to eq(5)
 #  end
 #
 #  it "had a hand of cards" do
 #    expect(player.hand.all?{ |card| card.is?(Card)}).to be_true
 #  end

 it "has a hand" do
   expect(player.hand.is_a? Hand).to be_true
 end

  it "can discard cards and get new cards"


  it "can fold its hand"


  it "can bet"


  it "can call a bet"


  it "can raise a bet"



end


require 'rspec'
require 'card'


describe Card do

  subject(:card) { Card.new(4, 'H') }

  it 'should hold a single value of a card' do
    expect(card.value).to eq(4)
  end


  it 'should hold a single suit' do
    expect(card.suit).to eq('H')
  end

  it 'should return two character string of card value' do
    expect(card.card_value).to eq('6H')
  end

end
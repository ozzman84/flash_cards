require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before(:each) do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography) #Card:0x00007fa16104e160
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM) #Card:0x00007fa160a62e90
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) #<Card:0x00007fa161a136f0
    deck = Deck.new([card_1, card_2, card_3])#<Deck:0x00007fa160a38ed8
    round = Round.new(deck) #=> #<Round:0x00007f972a1c7960...>,

  end
  it 'exists & has attributes' do
    expect(round.deck).to eq(deck)
    expect(round.turns).to eq([])
  end

  it 'returns current card' do
    expect(round.current_card).to eq(card_1)
  end

  # it 'exists & can take a turn' do
  #   new_turn = round.take_turn("Juneau") #=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">
  #
  #   new_turn.class #=> Turn
  #
  #   new_turn.correct? #=> true
  #
  #   round.turns #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
  #
  #   round.number_correct #=> 1
  #
  #   round.current_card #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
  #
  #   round.take_turn("Venus") #=> #<Turn:0x00007f972a215b38...>
  #
  #   round.turns.count #=> 2
  #
  #   round.turns.last.feedback #=> "Incorrect."
  #
  #   round.number_correct #=> 1
  #
  #   round.number_correct_by_category(:Geography) #=> 1
  #
  #   round.number_correct_by_category(:STEM) #=> 0
  #
  #   round.percent_correct #=> 50.0
  #
  #   round.percent_correct_by_category(:Geography) #=> 100.0
  #
  #   round.current_card #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
  # end
end

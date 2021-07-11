require './lib/card'
require './lib/turn'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.map do |card|
      card.category == category
    end
  end
end

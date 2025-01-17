require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck  = deck
    @turns = []
  end

  def current_card
    turn_count = @turns.count
    @deck.cards[turn_count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? if turn.card.category == category
    end
  end

  def percent_correct
    (number_correct.fdiv(@turns.count)) * 100
  end

  def percent_correct_by_category(category)
    num_by_category = @turns.count do |turn|
      turn.card.category == category
    end
    (number_correct_by_category(category).fdiv(num_by_category)) * 100
  end

  def categories
    categories_list = @deck.cards.map do |card|
      card.category
    end.uniq
  end

  def categories_strings
    categories_list = @deck.cards.map do |card|
      card.category.to_s.gsub('_', ' ')
    end.uniq
  end
end

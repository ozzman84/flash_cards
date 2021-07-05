class Turn
  attr_accessor :guess,
                :card

  def initialize(guess, card)
    @card  = card
    @guess = guess
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct? == true
      'Correct!'
    else
      "Incorrect."
    end
  end
end

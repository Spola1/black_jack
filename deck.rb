# Describe creation of deck
class Deck

  attr_reader :cards

  def initialize
    @cards = []
    cards_interfere
  end

  def cards_interfere
    Card::CARDS.each do |card|
      Card::SUITS.each do |suit|
        self.cards << Card.new(card, suit)
      end
    end
    self.cards.shuffle!
  end

  private

  attr_writer :cards
end

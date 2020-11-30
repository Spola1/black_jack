# Class manage cards and their values
class Card
  PICTURES = /^[VQK]$/.freeze
  CARDS = %w[2 3 4 5 6 7 8 9 10 V Q K A].freeze
  SUITS = %w[♤ ♡ ♧ ♢].freeze
  attr_reader :value, :suit, :points

  def initialize(value, suit)
    @value = value
    @suit = suit
    points
  end

  def points
    @points = if value.to_i > 0
      value.to_i
    elsif value =~ PICTURES
      10 else
      11
    end
  end

  def ace?
    self.points == 11
  end

  private

  attr_writer :value, :suit, :points
end

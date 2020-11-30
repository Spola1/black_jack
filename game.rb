# Class describe main game function
class Game
  attr_reader :bank
  def initialize
    @bank = 0
  end

  def bet(player1, player2)
    player1.change_balance(-10)
    player2.change_balance(-10)
    self.bank += 20
  end

=begin
ошибка без .hand[0]
bj/game.rb:16:in `give_card': undefined method `cards' for [#<Hand:0x000055b5f1d70300 @cards=[], @points=0>]:Array (NoMethodError)
=end

  def give_card(player, deck)
    card = deck.cards.pop
    player.hand.cards << card
    player.hand.count_points
  end

  def give_bank(player1, player2)
    points_p1 = player1.hand[0].points
    points_p2 = player2.hand[0].points
    if points_p1 == points_p2 || points_p1 > 21 && points_p2 > 21
      player1.change_balance(self.bank / 2)
      player2.change_balance(self.bank / 2)
    elsif points_p1 > points_p2 && points_p1 <= 21
      player1.change_balance(bank)
    else
      player2.change_balance(bank)
    end
    self.bank = 0
  end

=begin

что-то типо такого?

  def winner
    player = nil
      if points_p1 > points_p2 && points_p1 <= 21
    player = player1
      elsif points_p2 > points_p1 && points_p2 <= 21
    player = player2
  end
  player
end

=end

  private

  attr_writer :bank
end

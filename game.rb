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

  def give_card(player, deck)
    card = deck.cards.pop
    player.hand.cards << card
    player.hand.count_points
  end

  def give_bank(player1, player2)
    player1 = Player.new
    player2 = Player.new
  end

  def winner(player1, player2)
    points_p1 = player1.hand.points
    points_p2 = player2.hand.points
    if points_p1 == points_p2 || points_p1 > 21 && points_p2 > 21
      player1.change_balance(self.bank / 2)
      player2.change_balance(self.bank / 2)
      player = nil
    elsif points_p1 > points_p2 && points_p1 <= 21
      player1.change_balance(bank)
      player = player1
    else
      player2.change_balance(bank)
      player = player2
    end
    player
    self.bank = 0
  end



  private

  attr_writer :bank
end

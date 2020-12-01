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
# это все равно не рботет. не знаю как их правильно разбить
  def give_bank(player1, player2)
    if @player = p
      player1.change_balance(self.bank / 2)
      player2.change_balance(self.bank / 2)
    elsif @player = player1
      player1.change_balance(bank)
    else @player = player2
      player2.change_balance(bank)
    end
    self.bank = 0
  end

  def winner(player1, player2)
    points_p1 = player1.hand.points
    points_p2 = player2.hand.points
    if points_p1 = points_p2 || points_p1 > 21 && points_p2 > 21
      @player = p
    elsif points_p1 > points_p2 && points_p1 <= 21
      @player = player1
    else points_p2 > points_p1 && points_p2 <= 21
      @player = player2
    end
    @player
  end

  private

  attr_writer :bank
end

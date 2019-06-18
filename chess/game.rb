require_relative "display"
require_relative "board"
require_relative "humanplayer"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player_1 = HumanPlayer.new("Nian", Cursor.new([0,0], @board))
    @player_2 = HumanPlayer.new("Ruiyu", Cursor.new([7,7], @board))
    @current_player = @player_1
  end

  def play
    @display.render
    until @board.checkmate?(:white) || @board.checkmate?(:black)
      @current_player.make_move
      switch_player
      puts "#{@current_player.name}'s turn...'"
    end

    puts "game over"
  end

  def switch_player
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end


end

game = Game.new
game.play
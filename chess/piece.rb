require "byebug"

class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @symbol = :_
  end

  def inspect
    self.symbol
  end

  def valid_moves
    all_moves = self.moves 
    all_moves = all_moves.reject { |pos| move_into_check?(pos) }
    # debugger
  end

  def move_into_check?(end_pos)
    board_copy = self.board.dup
    board_copy.move_piece!(self.pos, end_pos)
    board_copy.in_check?(self.color)
  end

  def moves     # will be overwritten by individual pieces      
  end

  attr_reader :symbol, :color, :board
  attr_accessor :pos
end
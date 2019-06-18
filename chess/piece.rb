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

  attr_reader :symbol, :color
end
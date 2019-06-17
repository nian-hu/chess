class Pawn < Piece
  def initialize(board, color, pos, symbol)
    super(board, color, pos)
    @symbol = symbol
  end

end
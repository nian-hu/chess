class Pawn < Piece
  def initialize(board, color, pos)
    super
    @symbol = :P
  end
  
end
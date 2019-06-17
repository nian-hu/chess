class Queen < Piece
  def initialize(board, color, pos, symbol)
    super(board, color, pos)
    @symbol = symbol
    @move_
  end

  def move_dirs 
    return :both
  end

end
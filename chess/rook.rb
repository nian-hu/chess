class Rook < Piece
  def symbol
    :R
  end

  protected 
  def move_dirs 
    return :straight
  end

end
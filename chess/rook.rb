require_relative "slideable"

class Rook < Piece
  include Slideable

  def initialize(board, color, pos)
    super
    @symbol = :R
  end

  protected 
  def move_dirs 
    return :straight
  end

end
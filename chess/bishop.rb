require_relative "slideable"

class Bishop < Piece
  include Slideable

  def initialize(board, color, pos)
    super
    @symbol = :B
  end

  protected
  def move_dirs 
    return :diagonal
  end

end
require_relative "stepable"

class Knight < Piece
  include Stepable


  def initialize(board, color, pos)
    super
    @symbol = :N
  end

  protected
  def move_diff
    return :jump
  end

end
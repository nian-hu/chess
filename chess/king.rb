require_relative "stepable"

class King < Piece
  include Stepable

  
  def initialize(board, color, pos)
    super
    @symbol = :K

  end

  protected
  def move_diff
    return :step
  end

end
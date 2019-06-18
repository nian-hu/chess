require_relative "slideable"

class Queen < Piece
  include Slideable

  def initialize(board, color, pos)
    super
    @symbol = :Q
  end

  protected
  def move_dirs 
    return :both
  end

end
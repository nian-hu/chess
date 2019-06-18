require "singleton"

class NullPiece < Piece
  include Singleton
  attr_reader :color, :symbol

  def initialize
    @symbol = :N
  end

  def moves
  end
end
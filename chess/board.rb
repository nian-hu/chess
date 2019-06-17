require_relative "piece"

class Board

  attr_accessor :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    self.fill_board
  end

  def fill_board
    @rows.map!.with_index do |row, i|
      if i == 0 || i == 1 || i == 6 || i == 7
        row.map{ |spot| Piece.new}
      else
        row.map { |spot| nil }
      end
    end
  end

  def [](pos)
    x, y = pos
    self.rows[x][y]
  end

  def []=(pos, value)
    x, y = pos 
    self.rows[x][y] = value
  end

  def self.on_board?(pos)
    x, y = pos 
    return false if x < 0 || x > 7 || y < 0 || y > 7
    true
  end

  def move_piece(start_pos, end_pos)
    raise "There is no piece!" if self[start_pos] == nil 
    raise "The piece can't move there!" unless Board.on_board?(end_pos)            
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

end
require_relative "piece"
require_relative "rook"
require_relative "knight"
require_relative "bishop"
require_relative "king"
require_relative "queen"
require_relative "pawn"
require_relative "nullpiece"

class Board

  attr_accessor :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    fill_board
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

  private

  def fill_board
    self.rows.map!.with_index do |row, i|
      case i
      when 0
        fill_black_back
      when 1
        fill_black_pawns
      when 6
        fill_white_pawns
      when 7
        fill_white_back
      else
        row
      end
    end
  end

  def fill_black_back
    symbols = [:R, :KN, :B, :Q, :K, :B, :KN, :R]      # row is zero
    symbols.map.with_index do |symbol, i|             # position is (0, i)
      make_piece(symbol, :black, self, [0, i])
    end
  end 

  def fill_black_pawns
    (0...8).to_a.map do |i|
      make_piece(:P, :black, self, [1, i])
    end
  end

  def fill_white_back
    symbols = [:R, :KN, :B, :Q, :K, :B, :KN, :R]      # row is zero
    symbols.map.with_index do |symbol, i|             # position is (7, i)
      make_piece(symbol, :white, self, [7, i])
    end
  end

  def fill_white_pawns
    (0...8).to_a.map do |i|
      make_piece(:P, :white, self, [6, i])
    end
  end

  def make_piece(symbol, color, board, pos)
    case symbol 
    when :P 
      Pawn.new(color, board, pos)
    when :R
      Rook.new(color, board, pos)
    when :KN
      Knight.new(color, board, pos)
    when :B
      Bishop.new(color, board, pos)
    when :Q
      Queen.new(color, board, pos)
    when :K
      King.new(color, board, pos)
    end
  end

end
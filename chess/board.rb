require_relative "piece"
require_relative "rook"
require_relative "knight"
require_relative "bishop"
require_relative "king"
require_relative "queen"
require_relative "pawn"
require_relative "nullpiece"
require "byebug"

class Board

  attr_accessor :rows, :sentinel

  def initialize
    @sentinel = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, @sentinel)}
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

    raise "There is no piece!" if self[start_pos] == self.sentinel
    raise "The piece can't move there!" unless Board.on_board?(end_pos)            
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos] #swapping the objects at the positions
    # debugger
    #reassigning the already swapped objects their new positions after the swap
    self[start_pos].pos = start_pos
    self[end_pos].pos = end_pos   

  end

  def move_piece!(start_pos, end_pos)
    raise "There is no piece!" if self[start_pos] == self.sentinel
    current = self[start_pos]
    self[start_pos] = self.sentinel
    self[end_pos] = current

    #swapping the objects at the positions
    # debugger
    #reassigning the already swapped objects their new positions after the swap
    current.pos = end_pos
  end

  def find_pieces(color)
    color_pieces = []
    self.rows.each do |row|
      row.each do |spot|
        color_pieces << spot if spot.color == color
      end
    end
    color_pieces
  end

  def in_check?(color)
    color == :black ? opp = :white : opp = :black
    king_pos = find_king(color)
    opposing_pieces = find_pieces(opp)
    opposing_pieces.any? do |piece|
      piece.moves.include?(king_pos)
    end
  end

  def checkmate?(color)
    return true if in_check?(color) && find_pieces(color).all? do |piece|
      debugger
      piece.valid_moves.empty?
    end
    false
  end

  def dup
    new_board = Board.new
    self.rows.each_with_index do |row, i|
      row.each_with_index do |spot, j|
        if spot.class == NullPiece
          new_board[[i,j]] = new_board.sentinel
        else
          new_board[[i,j]] = make_piece(spot.symbol, spot.color, new_board, spot.pos)
        end
      end
    end
    new_board
  end

  # private # -----------------------------------

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
    symbols = [:R, :N, :B, :Q, :K, :B, :N, :R]      # row is zero
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
    symbols = [:R, :N, :B, :Q, :K, :B, :N, :R]      # row is zero
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
    when :N
      Knight.new(color, board, pos)
    when :B
      Bishop.new(color, board, pos)
    when :Q
      Queen.new(color, board, pos)
    when :K
      King.new(color, board, pos)
    end
  end


  public
  def find_king(color)
    self.rows.each do |row|
      row.each do |spot|
        return spot.pos if spot.color == color && spot.symbol == :K
      end
    end
  end

end
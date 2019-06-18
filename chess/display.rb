require_relative "board"
require_relative "cursor"
require "colorize"

class Display
  attr_reader :board, :cursor

  def initialize(board) 
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render 
    system("clear")
    pic = self.board.rows.map do |row|
      row.map do |spot|
        if spot.is_a? Piece
          uppercase = spot.symbol.to_s
          spot.color == :white ? uppercase.downcase : uppercase
        else
          "_"
        end
      end
    end

    x, y = self.cursor.cursor_pos
    pic[x][y] = pic[x][y].colorize(:white).on_black
  
    puts "  #{("A".."H").to_a.join(' ')}".colorize(:light_blue)
    pic.each_with_index do |row, i| 
      puts "#{8 - i}".colorize(:light_blue) + " #{row.join(' ')}"
    end
    puts "    "
  end

  def play 
    until self.cursor.cursor_pos == [7, 7]
      self.render 
      puts "move"
      self.cursor.get_input
    end
  end

end
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
    pic = self.board.rows.map do |row|
      row.map do |spot|
        if spot.is_a? Piece
          "P"
        else
          "X"
        end
      end
    end

    x, y = self.cursor.cursor_pos
    pic[x][y] = pic[x][y].colorize(:red)


    pic.each { |row| puts row.join(" ") }
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
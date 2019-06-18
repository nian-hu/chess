require_relative "display"

load 'display.rb'
board = Board.new
display = Display.new(board)

board.move_piece([6,5],[5,5])
board.move_piece([1,4],[3,4])
board.move_piece([6,6],[4,6])
board.move_piece([0,3],[4,7])
display.render
board.checkmate?(:white)

board2 = board.dup
display2 = Display.new(board2)
display2.render
# board.in_check?(:white)

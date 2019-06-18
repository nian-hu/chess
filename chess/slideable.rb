module Slideable
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1,1], [-1, -1], [-1, 1], [1, -1]]

  def add_direction(pos, dir)
    x, y = pos
    a, b = dir  
    [(x + a), (y + b)]
  end

  def horizontal_dirs #(start_pos)
    self.color == :black ? opp = :white : opp = :black
    possible_moves = []
    HORIZONTAL_DIRS.each do |dir|
      pos = self.pos.dup  

      pos = add_direction(pos, dir)
        until !is_valid?(pos) 
          if self.board[pos].color == self.color
            break
          elsif self.board[pos].color == opp
            possible_moves << pos 
            break
          else
            possible_moves << pos 
            pos = add_direction(pos, dir)
          end
        end
      end
      possible_moves  
  end

  def is_valid?(pos) #from Board class
    x, y = pos 
    return false if x < 0 || x > 7 || y < 0 || y > 7
    true
  end

  def diagonal_dirs #(start_pos)
    self.color == :black ? opp = :white : opp = :black
    possible_moves = []
    DIAGONAL_DIRS.each do |dir|
      pos = self.pos.dup  

      pos = add_direction(pos, dir)
        until !is_valid?(pos) 
          if self.board[pos].color == self.color
            break
          elsif self.board[pos].color == opp
            possible_moves << pos 
            break
          else
            possible_moves << pos 
            pos = add_direction(pos, dir)
          end
        end
      end
      possible_moves  
  end

  def moves
    case move_dirs
    when :straight        #rook
      return horizontal_dirs
    when :diagonal        #bishop
      return diagonal_dirs
    when :both            #queen
      return horizontal_dirs + diagonal_dirs
    end
  end

  def grow_unblocked_moves_in_dir(dx,dy)

  end

  private 
  def move_dirs     # will be overwritten in individual subclasses 
  end

end

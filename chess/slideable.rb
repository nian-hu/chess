module Slideable
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1,1], [-1, -1], [-1, 1], [1, -1]]

  def add_direction(pos, dir)
    x, y = pos
    a, b = dir  
    [(x + a), (y + b)]
  end

  def horizontal_dirs #(start_pos)
    possible_moves = []
    HORIZONTAL_DIRS.each do |dir|
      pos = self.pos.dup  

      pos = add_direction(pos, dir)
      until !is_valid?(pos)
        possible_moves << pos 
        pos = add_direction(pos, dir)
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
    possible_moves = []
    DIAGONAL_DIRS.each do |dir|
    pos = self.pos.dup  

    pos = add_direction(pos, dir)
      until !is_valid?(pos)
        possible_moves << pos 
        pos = add_direction(pos, dir)
      end
    end
    possible_moves  
  end

  def moves
    possible_moves = []

    case move_dirs
    when :straight #rook
      horizontal_dirs
    when :diagonal #bishop
      diagonal_dirs
    when :both #queen
      horizontal_dirs
      diagonal_dirs
    end

    possible_moves
  end

  private 
  def move_dirs     # will be overwritten in individual subclasses 
  end

end

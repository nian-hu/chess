module Stepable
  JUMP = [
    [-1, -2],
    [-2, -1],
    [-2, 1],
    [-1, 2],
    [1, 2],
    [2, 1],
    [2, -1],
    [1, -2]
  ]

  STEP = [
    [-1, -1],
    [-1, 0],
    [1, 0],
    [1, 1],
    [0, 1],
    [0, -1],
    [1, -1],
    [-1, 1]
  ]

  def add_direction(pos, dir)
    x, y = pos
    a, b = dir  
    [(x + a), (y + b)]
  end

  def is_valid?(pos) #from Board class
    x, y = pos 
    return false if x < 0 || x > 7 || y < 0 || y > 7
    true
  end

  def jump_dirs
    possible_moves = []
    JUMP.each do |dir|
      pos = add_direction(start_pos, dir)
      possible_moves << pos if is_valid?(pos)
    end
    possible_moves  
  end

  def step_dirs
    possible_moves = []
    STEP.each do |dir|
      pos = add_direction(start_pos, dir)
      possible_moves << pos if is_valid?(pos)
    end
    possible_moves  
  end

  def moves
    case move_diff
    when :jump       #knight
      return jump_dirs
    when :step        #king
      return step_dirs
    end
  end
  
  private

  def move_diff         # will be overwritten
  end




end
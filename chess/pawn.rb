class Pawn < Piece

  attr_reader :at_start_row

  def initialize(board, color, pos)
    super
    @symbol = :P
    @at_start_row = true
  end

  def add_direction(pos, dir)
    x, y = pos
    a, b = dir  
    [(x + a), (y + b)]
  end

  def is_valid_atk?(pos) 
    x, y = pos 
    return false if x < 0 || x > 7 || y < 0 || y > 7
    return false if self.board[pos].color == self.color
    true
  end

   def is_valid_step?(pos) 
    x, y = pos 
    return false if x < 0 || x > 7 || y < 0 || y > 7
    return false if self.board[pos].class != NullPiece
    true
  end
  
  def moves
    side_attacks + forward_steps
  end

  def side_attacks
    possible_attacks = []
    white_att = [[-1, -1], [1, -1]] 
    black_att = [[-1, 1], [1, 1]]

    if self.color == :black
      black_att.each do |dir| 
        poss_attack = add_direction(self.pos, dir) 
        if is_valid_atk?(poss_attack)
          piece = board[poss_attack]
          possible_attacks << poss_attack if piece.color == :white 
        end
      end
    else  
      white_att.each do |dir|
        poss_attack = add_direction(self.pos, dir) 
        if is_valid_atk?(poss_attack)
          piece = board[poss_attack]
          possible_attacks << poss_attack if piece.color == :black 
        end
      end
    end

    possible_attacks
  end

  def forward_steps
    dir = [[1, 0], [2, 0], [-1, 0], [-2, 0]]
    possible_moves = []

    if self.at_start_row
      if self.color == :black
        dir = dir.take(2)
        dir.each do |el| 
          try = add_direction(self.pos, el)
          possible_moves << try if is_valid_step?(try)
        end
      elsif self.color == :white
        dir = dir.drop(2)
        dir.each do |el| 
          try = add_direction(self.pos, el)
          possible_moves << try if is_valid_step?(try)
        end
      end

    else
      if self.color == :black
        dir = dir.take(1)
        try = add_direction(self.pos, el)
        possible_moves << try if is_valid_step?(try)
      elsif self.color == :white
        dir = dir[2]
        try = add_direction(self.pos, el)
        possible_moves << try if is_valid_step?(try)
      end
    end
    possible_moves
  end
  
end
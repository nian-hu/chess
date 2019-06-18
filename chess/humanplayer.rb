class HumanPlayer

  attr_reader :cursor, :name

  def initialize(name, cursor)
    @name = name
    @cursor = cursor
  end

  def make_move
    self.cursor.get_input
    self.cursor.get_input

  end

end
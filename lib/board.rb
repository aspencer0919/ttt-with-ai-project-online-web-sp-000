class Board

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    @input = nil
  end

  def cells(move)

  end

  def reset!
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


end

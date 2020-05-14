class Board

  attr_accessor :cells, :move
  def initialize
    @cells = cells
    @move = move
    @board = ["", "", "", "", "", "", "", "", ""]
  end

  def cells(move)

  end

  def reset!
    @board = []
  end


end

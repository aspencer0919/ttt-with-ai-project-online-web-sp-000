class Game

  attr_accessor :board, :player_1, :player_2, :winner, :user_input

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
     board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0]+1)
        return combo
      end
    end
    return false
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    if won? || draw? == true
      return true
    else
      return false
    end
  end

  def winner
    if won?
      combo = won?
      @board.cells[combo[0]]
    else
      return nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    @user_input = current_player.move(@board)
    if board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else
      turn
    end
  end

  def play
    turn until over?
    if won?
    	puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

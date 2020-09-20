class TicTacToe
  
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
    board
  end
  
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
      
      ]
      

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(user_input)
  user_input.to_i - 1
end
  
  def move(index, token = X)
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true 
    else 
      false
    end
  end
  
  def valid_move?(position)
      if position.between?(0,8) && !position_taken?(position) 
        return true
      else
      return false
      end 
end


def turn
  puts "Hey, what is your choice? Pick something between 1-9."
 choice = gets.chomp
 position = input_to_index(choice)
  if valid_move?(position)
   move(position, current_player)
   display_board
  else
    turn
  end
end
   
   def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
   
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
    
    def won?
      WIN_COMBINATIONS.detect do |combo|
        @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
      end
    end
    
    def full?
      @board.all?{|token| token == "X" || token == "O"}
    
    
    
    
    
    
end
    

  


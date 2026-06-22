require_relative "secret"



class Game 
  
  def initialize 
   
  end

  def new_game
    secret = Secret.new
    p secret.code
    puts secret.display_code
    secret.display_menu
    turn = 1

    #while turn <= 12
    input = gets.chomp.chars.map(&:to_i)
    p input

    match = input.zip(secret.code).map { |x, y| x == y }.count(true)
    p "#{match} right guesses "
    color_match = input.zip(secret.code).map {}
    
    #end

    #end

   # turn + 1 
  end



end

Game.new.new_game

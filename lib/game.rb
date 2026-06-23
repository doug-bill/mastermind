require_relative "secret"


# 
class Game

  def new_game
    secret = Secret.new
    #p secret.code 
    #puts secret.display_code
    secret.display_menu
    turn = 1
    total_turns = 12

    while turn <= total_turns
      color_only = 0
      remaining_guess  = []
      remaining_secret = []
      input = []

      loop do
        input = gets.chomp.chars.map(&:to_i)
        break if valid_input?(input)

        puts "Invalid input! Try again..."
      end

      p input
      puts secret.display_guess(input)
      puts "\n"

      if input == secret.code
        puts "Congrats!!!, You've craked the Code =)"
        break
      else

        match = input.zip(secret.code).map { |x, y| x == y }.count(true)

        input.zip(secret.code).each.with_index do |(x, y), index|
          if x == y
            input.delete(index)
          elsif x != y
            remaining_secret << y
            remaining_guess << x
          end
        end

        remaining_guess.each do |color|
          if remaining_secret.include?(color)
            color_only += 1
            remaining_secret.delete(remaining_secret.index(color))
          end
        end
        #p remaining_guess

        p "#{match} right guesses and #{color_only} color-only matches!!!"

      end
      turn += 1
      puts "Try Again! You got #{total_turns - turn + 1} more tries"
      if turn > total_turns
        puts "You Lose!! Better luck Next Time!"
        break
      end
    end
  end

  def valid_input?(input)
    input.length == 4 && input.all? { |n| n.between?(1, 6) }
  end


    # def game_over

    # end
end

#Game.new._game

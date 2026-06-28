# all the logic for the CPU randomizer.

require "colorize"


# class to define the secret code of the game.
class Secret
  attr_reader :code, :color_map, :colors

  def initialize

    @color_map = {
      1 => "●".colorize(:red),
      2 => "●".colorize(:blue),
      3 => "●".colorize(:green),
      4 => "●".colorize(:yellow),
      5 => "●".colorize(:magenta),
      6 => "●".colorize(:white)
    }

    @colors = [1, 2, 3, 4, 5, 6]
    @code = Array.new(4) { @colors.sample }
    # @code2 = [1, 1, 3, 4] # EdgeCase Testing
    # @code3 = [3, 5, 4, 5] # EdgeCase Testing
  end

  def display_code
    @color_code = @code.map { |num| @color_map[num] }.join(" ")
  end

  def display_menu

    puts "\nPick 4 colors using their numbers:"
    puts @color_map.map { |key, value| "#{key}: #{value}" }.join("  ")
    puts "\nEnter your guess (e.g. 1 3 2 5):"
  end

  def display_color_code(input)
    input.map { |num| @color_map[num] }.join(" ")
  end

end

 secret = Secret.new
# p secret.code
#puts secret.display_code
# puts secret.display_menu

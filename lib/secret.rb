# all the logic for the CPU randomizer.

require "colorize"

#class to define the secret code of the game.
class Secret
  attr_reader :code

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

  end

  def display_code
    @color_code = @code.map { |num| @color_map[num] }.join(" ")
  end

end

secret = Secret.new
p secret.code
puts secret.display_code

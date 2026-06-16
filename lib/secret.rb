# all the logic for the CPU randomizer.

require "colorize"

color_map= {
  1 => "●".colorize(:red),
  2 => "●".colorize(:blue),
  3 => "●".colorize(:green),
  4 => "●".colorize(:yellow),
  5 => "●".colorize(:magenta),
  6 => "●".colorize(:white)
}

colors = [1, 2, 3, 4, 5, 6]
code = []

snippet = Array.new(4) { colors.sample }
code.push(snippet.map { |num| color_map[num] }.join(" "))

p snippet
puts code

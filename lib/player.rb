# The player options

require_relative "secret"

puts "Pick 4 colors using their numbers:

1: ● red 2: ● blue, 3: ● green, 4: ● yellow, 5: ● magenta, 6: ● white,

Enter your guess (e.g. 1 3 2 5):"

input = gets.chomp.chars.map(&:to_i)

p input

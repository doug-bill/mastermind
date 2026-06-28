# The player options

require_relative "secret"

input = []

def valid_input?(input)
  input.length == 4 && input.all? { |n| n.between?(1, 6) }
end

secret = Secret.new
puts "You're now the Codebreaker, create your secret code:"
secret.display_menu

loop do
  input = gets.chomp.chars.map(&:to_i)
  break if valid_input?(input)

  puts "Invalid input! Choose 4 numbers between 1 ~ 6"
end

p input
puts secret.display_guess(input)
puts "\n"

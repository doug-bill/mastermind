# The player options

require_relative "secret"

secret = Secret.new

secret.display_menu 
input = gets.chomp.chars.map(&:to_i)

p input

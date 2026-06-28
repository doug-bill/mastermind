 
require_relative "secret"
require "tty-prompt"
require "ruby_figlet"
using RubyFiglet


#
class NewGame
  attr_reader :title_screen, :terminal_width

  def initialize
    @secret = Secret.new
    @title = RubyFiglet::Figlet.new "Mastermind", "basic"
    @terminal_width = IO.console.winsize[1]
    @title_screen = @title.to_s.lines.each do |line|
      puts line.chomp.center(terminal_width).colorize(:green)
    end
  end

  def game_title
    #puts @title_screen

    description = "\n Mastermind is a game of skill, in which two players engage in a battle of wits and logic.
  \n1. The Codebreaker supplies a guess for the secret code hidden by the Codemaker.
    2. The Codemaker then scores the Codebreaker's guess against the hidden secret code,
    and provides the Codebreaker with a feedback to be used in preparing the next guess."
    description.lines.each do |line|
      puts line.strip.center(terminal_width)
    end
    start
  end

  def start
    puts "\n What kind of game would you like?"
    prompt = TTY::Prompt.new
    choices = %w(Codebreaker Codemaker)
    selection = prompt.select("Choose your playstyle?", choices)

    case selection
    when "Codebreaker"
      code_breaker
    else
      puts "(」°ロ°)」 Sorry this option is currently in development, comeback in the next release"
      start
    end
  end

  def code_breaker

    @secret.display_menu
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

        puts "Invalid input! Choose 4 numbers between 1 ~ 6"
      end

      #p input
      puts @secret.display_color_code(input)
      puts "\n"

      if input == @secret.code
        puts "Congrats!!!, You've craked the Code =)"
        break
      else

        match = input.zip(@secret.code).map { |x, y| x == y }.count(true)

        input.zip(@secret.code).each.with_index do |(x, y), index|
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

        p "#{match} right guesses and #{color_only} color-only matches!!!"

      end
      turn += 1
      if turn > total_turns
        puts "You Lose!! Better luck Next Time!"
        sleep 2
        game_over
      else
        puts "Try Again! You got #{total_turns - turn + 1} more tries"
      end
    end
  end

  def valid_input?(input)
    input.length == 4 && input.all? { |n| n.between?(1, 6) }
  end

  def game_over
    puts "Game Over !!!"

    puts "Play Again? (y/n)"
    answer = gets.chomp

    if answer == "y"
      start
    else
      exit
    end
  end
end

# NewGame.new.game_title
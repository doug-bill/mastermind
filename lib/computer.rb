# require_relative "secret"




# class CPU
#   #att_reader: answer

#   def initialize
#     secret = Secret.new
#     @all_answers = secret.colors.product(* [secret.colors] * 3).map(&:join)
#     @all_scores = Hash.new { |h, k| h[k] = {} }

#     @all_answers.product(@all_answers).each do |guess, answer|
#       @all_scores[guess][answer] = calculate_score(guess, answer)
#     end

#     @all_answers = all_answers.to_set
#   end

#   def make_guess
#     if @guesses > 0
#       @possible_answers.keep_if {|answer|
#         @all_scores[@guess][answer] == @score
#     }
#     end
#   end

#   def play_vars
#     secret = Secret.new
#     @guesses = 0
#     #answer = 4.times.map {"123456".chars.sample}.join
#     answer = secret.code
#     puts @cpu_code = secret.display_color_code(answer)
#     @possible_scores = @all_scores.dup
#     @possible_answers = @all_answers.dup

#     while @guesses < 12
#       @guess = make_guess
#       if @all_answers.include?(@guess)
#         @guesses += 1
#         @score = calculate_score(@guess, @answer)
#         if score == secret
#           p [@guesses, @guess]
#           break
#         end
#       end
#     end
#   end

#   def calculate_score(guess , answer)
#     score = ""
#     wrong_guess_pegs, wrong_answers_pegs = [], []
#     pegs_pairs = guess.chars.zip(answer.chars)

#     peg_pairs.each do |guess_peg, answer_peg|
#       if guess_peg == answer_peg
#         score << "B"
#       else
#         wrong_guess_pegs << guess_peg
#         wrong_answers_pegs << answer_peg
#       end
#     end
#     wrong_guess_pegs.each do |peg|
#       if wrong_answers_pegs.include?(peg)
#         wrong_answers_pegs.delete(peg)
#         score << "W"
#       end
#     end

#     score
#   end
# end

# CPU.new.play_vars


#   # @all_answers = secret.colors.product(* [secrect.colors] * 3).map(&:join)
#   # @all_scores = Hash.new { |h, k| h[k] = {} }

#   # @all_answers.product(@all_answers).each do  |guess, answer|
#   #   @all_scores[guess][answer] = calculate_score(guess, answer)
#   # end

#   # @all_answers = @all_answers.to_set
#   # 
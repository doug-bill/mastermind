#  input.zip(secret.code).each do | x, y|
#       unless x == y
#         remaining_guess << x
#         remaining_secret << y
#       end
#     end

#     remaining_guess.each do |color|
#       if remaining_secret.include?(color)
#         color_only += 1
#         remaining_secret.delete_at(remaining_secret.index(color))
#       end
#     end
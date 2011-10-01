
# Print the string “Hello, world.”
puts 'Hello, word.'

# For the string “Hello, Ruby,” find the index of the word “Ruby.”
'Hello, Ruby.'.index 'Ruby'

# Print your name ten times.
10.times { puts 'Arturo' }

# Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
1.upto(10) { |num| puts "This is sentence number #{num}" }

# Run a Ruby program from a file.
    #ruby day-1.rb

# Write a program that picks a random number. Let a player guess the number,
# telling the player whether the guess is too low or too high.
secret = rand(10)
guess = -1

while guess != secret do
    puts 'Enter a number:'
    guess = gets.to_i
    puts 'Too high' if guess > secret
    puts 'Too low'  if guess < secret
end


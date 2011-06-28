
# cs50.tv pset1 skittles.c

class Game
attr_accessor :name, :target_number, :player_guess, :got_it_right, :counter

def intro
	puts "We're going to play a guessing game. What's your name?"
	@name = gets.chomp
	puts "Hi #{@name}! I'm so glad to meet you. I'm thinking of a number " + 		"between 0 and 100! Go ahead and guess what it is!" 
end 

def set_number
	@target_number = rand(100)
end 

def check_for_win
		
	@counter = 0
	@got_it_right = false
	while @got_it_right == false do 
	@counter += 1	
	@player_guess = gets.to_i	
	if @player_guess < 1
		 puts "Now, don't be difficult. Try again!" 
	elsif @player_guess > 99
		 puts "Now, don't be difficult. Try again!"	
	elsif @player_guess < @target_number
		 puts "Sorry, try a higher number!"
	elsif @player_guess > @target_number
		 puts "Sorry, try a lower number." 
	else @got_it_right = true end
	end 

	if @got_it_right == true
		 puts "Congratulations #{@name}, you won the game!" + 
		" It only took #{@counter} tries! You're so very clever." end
end 

def initialize
	intro
	set_number
	check_for_win
end

end 

Game.new

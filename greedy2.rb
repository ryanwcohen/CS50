
# cs50.tv pset1 greedy.c
# calculates the minimum number of coins you need to make change for a given amount of cash
# NB: assumes a universe in which dollar coins do not exist
# (seriously, who wants to see William Henry Harrison on a coin?)

class Clerk 
attr_accessor :change_remaining, :coins, :quarters, :dimes, :nickels, :pennies

def ask_change
	puts "How much change is owed? Don't use dollar signs."
	@change_remaining = gets.to_f
	@coins = 0
	@quarters = 0
	@dimes = 0
	@nickels = 0	
	@pennies = 0
end  

def make_change
	
	while @change_remaining >= 0.01 do 
	@coins += 1		
	if @change_remaining >= 0.25
		@change_remaining -= 0.25
		@quarters += 1
	elsif @change_remaining >= 0.10
		@change_remaining -= 0.10
		@dimes += 1
	elsif @change_remaining >= 0.05
		@change_remaining -= 0.05
		@nickels += 1
	else @change_remaining -= 0.01 
		@pennies += 1 end
	end
end

def how_many
	puts "Your change consists of #{quarters} quarters, #{dimes} dimes, #{nickels} nickels, and #{pennies} useless, useless pennies." 
	puts "#{@coins} coins in total."
end

def initialize 
	ask_change	 
	make_change
	how_many
end 

end

Clerk.new


# cs50.tv pset1 greedy.c
# calculates the minimum number of coins you need to make change for a given amount of cash
# NB: assumes a universe in which dollar coins do not exist
# (seriously, who wants to see William Henry Harrison on a coin?)

class Clerk 
attr_accessor :coins, :change_remaining

def ask_change
	puts "How much change is owed? Don't use dollar signs."
	@change_remaining = gets.to_f
	@coins = 0
end 

def make_change
	
	while @change_remaining > 0 do 
	@coins += 1	
	if @change_remaining >= 0.25 then @change_remaining -= 0.25
	elsif @change_remaining >= 0.10 then @change_remaining -= 0.10
	elsif @change_remaining >= 0.05 then @change_remaining -= 0.05
	else @change_remaining -= 0.01 end
	end
end

def how_many
	puts @coins
end

end 

dante = Clerk.new
dante.ask_change
dante.make_change
dante.how_many

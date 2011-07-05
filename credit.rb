# CS50.tv pset1-h credit.c
# validates a credit card number against first two digits, length and Luhn's algorithm

class Credit
attr_accessor :card_number, :vault, :card_type, :card_length, :card_length_valid, :luhn_valid

# takes in Bignum from user, converts it into String, splits String into an array of strings
def load_number 
	print "Enter number: "
	@card_number = gets.to_s.chomp
	@vault = @card_number.split(//)
	@card_length = @card_number.length
end

# checks first two digits of the number to validate as a recognized type
def validate_type 
	if @vault[0].to_i == 3 && @vault[1].to_i == 4
		@card_type = "AMEX"
	elsif @vault[0].to_i == 3 && @vault[1].to_i == 7
		@card_type = "AMEX"
	elsif @vault[0].to_i == 4
		@card_type = "VISA"
	elsif @vault[0].to_i == 5 && @vault[1].to_i == 1
		@card_type = "MASTERCARD"
	elsif @vault[0].to_i == 5 && @vault[1].to_i == 2
		@card_type = "MASTERCARD"
	elsif @vault[0].to_i == 5 && @vault[1].to_i == 3
		@card_type = "MASTERCARD"
	elsif @vault[0].to_i == 5 && @vault[1].to_i == 4
		@card_type = "MASTERCARD"
	elsif @vault[0].to_i == 5 && @vault[1].to_i == 5
		@card_type = "MASTERCARD"
	else @card_type = "INVALID" end
end 

# make sure length matches the proper card type 
def validate_length
	if @card_length == 15 && @card_type == "AMEX"
		@card_length_valid = "VALID" 
	elsif @card_length == 16 && @card_type == "MASTERCARD"
		@card_length_valid = "VALID"
	elsif @card_length == 13 && @card_type == "VISA"
		@card_length_valid = "VALID"
	elsif @card_length == 16 && @card_type == "VISA"
		@card_length_valid = "VALID"
	else @card_length_valid = "INVALID" end
end


def display_results
	puts ""	
	puts "Test Results"
	puts "Card number: #{@card_number}"
	puts "Type test: #{@card_type}"
	puts "Length test: #{@card_length_valid}"
#	puts "Luhn algorithm test: #{@luhn_valid}"
	puts ""
end

def test_battery
	puts @card_number
	puts @vault.inspect
	puts @card_type
	puts @card_length
end 

def initialize
	load_number
	validate_type
	validate_length
#	validate_luhn
#	test_battery
	display_results
end 

end 

Credit.new


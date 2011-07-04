
# CS50.tv pset1-h credit.c
# validates a credit card number against first two digits, length and Luhn's algorithm

class Credit
attr_accessor :card_number, :vault, :card_type, :card_length, :card_length_valid, :luhn_valid,
 :luhn_vault, :luhn_number, :luhn_place1, :luhn_place2, :luhn_number2

# takes in Bignum from user, converts it into String, splits String into an array of strings
def load_number 
	print "Enter number: "
	@card_number = gets.to_s.chomp
	@vault = @card_number.split(//)
	@card_length = @card_number.length
end


CARD_NUMBER_PATTERNS = {
  /^3[47].*/ => "AMEX",
  /^4.*/ => "VISA",
  /^5[12345].*/ => "MASTERCARD"
}

# checks first two digits of the number to validate as a recognized type
def validate_type
  @card_type = "INVALID"
  CARD_NUMBER_PATTERNS.each_pair do |pattern, card_type|
    next unless @card_number =~ pattern
    @card_type = card_type
    break
  end
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

# run the card number through the luhn algorithm to make sure it's syntactically kosher
# yes, I'm aware this isn't anywhere near elegant

def validate_luhn1
	@luhn_number = " "

	if @card_length == 13  
		@luhn_place1 = 1
		@luhn_place2 = 0	
	elsif @card_length == 15
		@luhn_place1 = 1
		@luhn_place2 = 0
	elsif @card_length == 16
		@luhn_place1 = 0
		@luhn_place2 = 1
	else 
	  @luhn_valid = "INVALID"
	  return
	end 
			
	while @luhn_place1 <= @card_length do			
		@luhn_number += (@vault[@luhn_place1].to_i * 2).to_s 
		@luhn_place1 += 2		
		end
	@luhn_vault = @luhn_number.split(//)

	luhn_subtotal = 0	
	@luhn_vault.each do |x| 
		luhn_subtotal += x.to_i 
		end 

	@luhn_number2 = 0

	while @luhn_place2 <= @card_length do
		@luhn_number2 += @vault[@luhn_place2].to_i
		@luhn_place2 += 2		
		end
	
	check = luhn_subtotal + @luhn_number2

	if check.remainder(10) == 0
		@luhn_valid = "VALID"
	else @luhn_valid = "INVALID" end

end

def display_results
	puts ""	
	puts "Test Results"
	puts "Card number: #{@card_number}"
	puts "Type test: #{@card_type}"
	puts "Length test: #{@card_length_valid}"
	puts "Luhn algorithm test: #{@luhn_valid}"
	puts ""
end

def initialize
	load_number
	validate_type
	validate_length
	validate_luhn1
	display_results
end 

end 

Credit.new


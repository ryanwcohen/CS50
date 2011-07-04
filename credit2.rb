
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


CARD_TYPES_BY_PATTERN = {
  /^3[47].*/ => "AMEX",
  /^4.*/ => "VISA",
  /^5[12345].*/ => "MASTERCARD"
}

CARD_LENGTHS_BY_TYPE = {
  "AMEX" => [15],
  "MASTERCARD" => [16],
  "VISA" => [13,16]
}
CARD_LENGTHS_BY_TYPE.default = []

# checks first two digits of the number to validate as a recognized type
def validate_type
  @card_type = "INVALID"
  CARD_TYPES_BY_PATTERN.each_pair do |pattern, card_type|
    next unless @card_number =~ pattern
    @card_type = card_type
    break
  end
end 

# make sure length matches the proper card type 
def validate_length
  if CARD_LENGTHS_BY_TYPE[@card_type].include? @card_length
    @card_length_valid = "VALID"
  else
    @card_length_valid = "INVALID"
  end
end

# run the card number through the luhn algorithm to make sure it's syntactically kosher
# yes, I'm aware this isn't anywhere near elegant

def validate_luhn1
	@luhn_number = " "
  @luhn_checksum = 0

	@vault.map(&:to_i).each_with_index do |digit, index|
	  if @card_length.remainder(2) == (index + 1).remainder(2)
	    @luhn_checksum += digit
    else
      @luhn_checksum += (digit * 2).to_s.chars.inject(0){|subtot,digit| subtot + digit.to_i}
    end
	end

	if @luhn_checksum.remainder(10) == 0
		@luhn_valid = "VALID"
	else 
	  @luhn_valid = "INVALID"
	end
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


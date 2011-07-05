
# cs50.tv pset2 caesar.c

class Caesar
attr_accessor :key, :file_out, :plaintext, :encrypted_text, :character_to_digit, :digit_to_character

# when running program user specifies in command line: 1) file to encrypt 2) the Caesar cipher key 3) name of the encrypted file to output 

def input 
	@plaintext = File.read(ARGV[0]).split(//)
	@key = ARGV[1].to_i
	@file_out = ARGV[2]
end 

# encrypts the plaintext, rotating along alphabet by places equal to key
# has.key?() method leaves punctuation and space formatting unciphered
# converts uppercase to lowercase as temporary workaround until caps can be implemented

def chiffre 

	@character_to_digit = {'a',1,'b',2,'c',3,'d',4,'e',5,'f',6,'g',7,'h',8,'i',9,'j',10,'k',11,'l',12,'m',13,'n',14,'o',15,'p',16,'q',17,'r',18,'s',19,'t',20,'u',21,'v',22,'w',23,'x',24,'y',25,'z',26}
	@digit_to_character = {1,'a',2,'b',3,'c',4,'d',5,'e',6,'f',7,'g',8,'h',9,'i',10,'j',11,'k',12,'l',13,'m',14,'n',15,'o',16,'p',17,'q',18,'r',19,'s',20,'t',21,'u',22,'v',23,'w',24,'x',25,'y',26,'z'}
	
	@encrypted_text = ""
	@plaintext.each do |character| 
		character = character.downcase
		
		if @character_to_digit.has_key?(character) == false
			new_character = character
		else	original_number = @character_to_digit[character]
			new_number = original_number.to_i + @key

			if new_number > 26
				new_number = new_number.modulo(26) end
		
			new_character = @digit_to_character[new_number]
		end
		
		@encrypted_text += new_character 
		end
end 

# spits the encrypted text out into a new text file

def output 
	File.open("#{@file_out}", "w+") do |f|
	   f.puts "#{@encrypted_text}"
	end 
end 

def initialize
	input 
	chiffre
	output
end 

end 

Caesar.new


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
# converts uppercase to lowercase as temporary workaround until caps can be implemented (separate hash?)

def chiffre 

	@character_to_digit = {'a',0,'b',1,'c',2,'d',3,'e',4,'f',5,'g',6,'h',7,'i',8,'j',9,'k',10,'l',11,'m',12,'n',13,'o',14,'p',15,'q',16,'r',17,'s',18,'t',19,'u',20,'v',21,'w',22,'x',23,'y',24,'z',25}
	@digit_to_character = {0,'a',1,'b',2,'c',3,'d',4,'e',5,'f',6,'g',7,'h',8,'i',9,'j',10,'k',11,'l',12,'m',13,'n',14,'o',15,'p',16,'q',17,'r',18,'s',19,'t',20,'u',21,'v',22,'w',23,'x',24,'y',25,'z'}
	
	@encrypted_text = ""
	@plaintext.each do |character| 
		character = character.downcase
		
		if @character_to_digit.has_key?(character) == false
			new_character = character
		else	original_number = @character_to_digit[character]			
			@new_number = original_number.to_i + @key

			if @new_number < 0 
				@new_number = -1*(@new_number) end

			if @new_number > 25
				@new_number = @new_number.modulo(26) end
		
			new_character = @digit_to_character[@new_number]
		end
		
		@encrypted_text += new_character.to_s 
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
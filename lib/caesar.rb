
module Caesar

  CHARACTER_TO_DIGIT = {'a',0,'b',1,'c',2,'d',3,'e',4,'f',5,'g',6,'h',7,'i',8,'j',9,'k',10,'l',11,'m',12,'n',13,'o',14,'p',15,'q',16,'r',17,'s',18,'t',19,'u',20,'v',21,'w',22,'x',23,'y',24,'z',25}
  DIGIT_TO_CHARACTER = CHARACTER_TO_DIGIT.invert

  def self.encipher(key, plaintext)
    encrypted_text = ""
    plaintext.each_char do |character|
      character = character.downcase
  
      if CHARACTER_TO_DIGIT.has_key?(character)
        original_number = CHARACTER_TO_DIGIT[character]
        new_number = (original_number.to_i + key) % 26 # modulo won't affect values < 26
        new_character = DIGIT_TO_CHARACTER[new_number]
      else
        new_character = character
      end
      encrypted_text += new_character.to_s 
    end
    encrypted_text
  end 
  
  def self.decipher(key, ciphertext)
    self.encipher(26 - key, ciphertext)
  end


end
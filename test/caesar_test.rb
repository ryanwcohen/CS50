require "test/unit"
require "lib/caesar.rb"
class CaesarTest < Test::Unit::TestCase

  # This could really stand for some better coverage, but I leave that as
  # an excercise for you...

  def test_encipher_does_not_return_original_string
    plaintext = "this. is? a, test!"
    assert_not_equal plaintext, Caesar.encipher(5, plaintext)
  end
  
  def test_encipher_preserves_punctuation_and_whitespace
    assert_match /\w{4}\. \w{2}\? \w{1}, \w{4}!/, Caesar.encipher(5, "this. is? a, test!")
  end
  
  def test_decipher_returns_plaintext_from_ciphertext_when_given_original_key
    plaintext = "this. is? a, test!"
    key = 5
    assert_equal plaintext, Caesar.decipher(key, Caesar.encipher(key, plaintext))
  end
  

end
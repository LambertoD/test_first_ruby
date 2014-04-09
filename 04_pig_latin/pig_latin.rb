def translate(input_words)
  words = input_words.split
  new_word = ""
  words.each do |word| 
    new_word << translate_single_word(word) + "ay "
  end
  new_word.rstrip
end
def translate_single_word(word)

  vowel_test = word.match(/^[a|e|i|o|u]/)
  return word if vowel_test

  test_word = word.split('')    
  beginning_consonant_count = -1

  test_word.each do |letter|
    if consonant_test(letter)
      beginning_consonant_count += 1
      if letter == 'q'
        beginning_consonant_count += 1
        break
      end
    else
      break
    end
  end
  test_word[beginning_consonant_count+1..-1].join('') + test_word[0..beginning_consonant_count].join('')

end
def consonant_test(letter)
  letter.match(/^[^a|e|i|o|u]/)
end

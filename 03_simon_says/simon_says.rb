def echo(word)
  word
end
def shout(word)
  word.upcase
end
def repeat(word, times = 2)
  new_word = "#{word} " * times
  new_word.chomp(" ")
end
def start_of_word(word, start)
  word[0..start - 1]
end
def first_word(words)
  words.scan(/\w+/).first
end
def titleize(words)
  little_words = /and|over|the/
  new_str = words.split(/\s+/).map do |word| 
    if word =~ little_words 
      word 
    else
      word.capitalize
    end
  end
  new_str.first.capitalize!
  new_str = new_str.join(' ')
end

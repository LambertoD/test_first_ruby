
class Book
  attr_writer :title
  def title
    titleize @title
  end

  private
  def titleize(words)
    little_words = /and|over|the|^in|of|^a$|^an/
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
end
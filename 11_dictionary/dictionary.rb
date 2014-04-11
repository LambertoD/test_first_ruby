class Dictionary
  attr_accessor :entries
  def initialize
    @entries = Hash.new(nil)
  end
  def add(value)
    if value.is_a? Hash
      @entries.merge! value 
    else
      @entries = {"#{value}" => nil} 
    end
  end
  def keywords
    @entries.keys
  end
  def include?(key)
    @entries.has_key?(key)
  end
  def find(value)
    if @entries.empty?
      {}
    elsif include?(value)
      puts "got elsif  with #{value} and #{@entries}"
      @entries
    else
      puts "got else  with #{value} and #{@entries}"
      stuff = @entries.find_all {|key,value| key.start_with? value}
      puts stuff
      stuff
    end
  end

end

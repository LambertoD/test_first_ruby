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
    @entries.keys.sort
  end
  def include?(key)
    @entries.has_key?(key)
  end
  def find(value)
    if @entries.empty?
      {}
    elsif include?(value)
      @entries
    else
      @entries.select {|h| h.start_with? value}
    end
  end
  def printable
    hash_to_string = ""
    @entries.each do |key,value|
      hash_to_string << "[#{key}] \"#{value}\"\n"
    end
    hash_to_string
  end
end
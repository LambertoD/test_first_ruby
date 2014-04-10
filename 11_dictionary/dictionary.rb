class Dictionary
  attr_accessor :entries
  def initialize
    @entries = {}
  end
  def add(value)
    @entries = value
  end
  def keywords
    @entries.keys
  end
end
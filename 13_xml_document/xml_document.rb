class XmlDocument
  def hello(*args, &block)
    if block_given?
      parse_with_begin_and_end_tags(block)
    else
      parse_single_tag(*args)
    end
  end
  def method_missing(name, *args, &block)
    "<#{name}/>"
  end

  private
  def parse_single_tag(*name)
    attribute = ''
    h_name = eval(name.join)
    unless h_name.nil?
      attribute = h_name.map {|key,value| 
        attribute_name = key.to_s
        attribute_value = value
        " #{attribute_name}=\'#{attribute_value}\'"
      }.join
    end
    "<hello#{attribute}/>"
  end
  def parse_with_begin_and_end_tags(block)
    nested_block = block
    "<hello>" + block.call + "</hello>"
  end
end
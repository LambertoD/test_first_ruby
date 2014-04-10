class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end
  def time_string
    convert_seconds_for_display(@seconds)
  end

  private
  def convert_seconds_for_display(seconds)
    hour_string = minute_string = second_string = ""    
    hours = minutes = 0
    minutes = seconds / 60
    if minutes > 60 
      hours = minutes / 60 
      minutes = minutes % 60
    end
    seconds = seconds % 60
    hour_string   = get_string_time_values(hours)
    minute_string = get_string_time_values(minutes)
    second_string = get_string_time_values(seconds)
    "#{hour_string}:#{minute_string}:#{second_string}"  
  end
  def get_string_time_values(number)
    if number < 10
      return "0#{number}"
    else
      return number.to_s
    end
  end
end
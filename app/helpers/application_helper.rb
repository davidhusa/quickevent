module ApplicationHelper
  def pretty_time(time)
    time.strftime("%-l:%M %P")
  end

  def pretty_date(date)
    date.strftime("%A, %B %e, %Y")
  end

  def pretty_quick_date(date, joiner = "/")
    return_string = []
    return_string << date.strftime("%-m")
    return_string << date.strftime("%e")
    return_string << date.strftime("%y")
    
    return_string.join(joiner)
  end
end

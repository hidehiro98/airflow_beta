module ApplicationHelper
  def comment_time(time)
    interval = (time / (60 * 60 * 24 * 30 * 12)).to_i

    if interval > 1
      return "#{interval} years"
    elsif interval == 1
      return "#{interval} year"
    else
      interval = (time / (60 * 60 * 24 * 30)).to_i
    end

    if interval > 1
      return "#{interval} months"
    elsif interval == 1
      return "#{interval} month"
    else
      interval = (time / (60 * 60 * 24)).to_i
    end

    if interval > 1
      return "#{interval} days"
    elsif interval == 1
      return "#{interval} day"
    else
      interval = (time / (60 * 60)).to_i
    end

    if interval > 1
      return "#{interval} hours"
    elsif interval == 1
      return "#{interval} hour"
    else
      interval = (time / (60)).to_i
    end

    if interval > 1
      "#{interval} minuites"
    elsif interval == 1
      "#{interval} minuite"
    else
      'seconds'
    end
  end
end

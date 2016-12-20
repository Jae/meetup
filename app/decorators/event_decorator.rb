class EventDecorator < SimpleDelegator
  def start_time
    format_time(super)
  end

  def end_time
    format_time(super)
  end

  private
  def format_time(time)
    time.try(:strftime, "%d/%m/%Y %H:%M")
  end
end

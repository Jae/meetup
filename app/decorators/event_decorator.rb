class EventDecorator < SimpleDelegator
  def start_time
    format(super)
  end

  def end_time
    format(super)
  end

  private
  def format(time)
    time.strftime("%d/%m/%Y %H:%M")
  end
end

class PreferenceDecorator < SimpleDelegator
  def start_times_from
    format_time(start_times.try(:first))
  end

  def start_times_to
    format_time(start_times.try(:last))
  end

  private
  def format_time(time)
    time.try(:strftime, "%Y-%m-%dT%H:%M:%S")
  end
end

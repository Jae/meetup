class PreferenceDecorator < SimpleDelegator
  def start_times_from
    format(start_times.try(:first))
  end

  def start_times_to
    format(start_times.try(:last))
  end

  private
  def format(time)
    time.try(:strftime, "%Y-%m-%dT%H:%M:%S")
  end
end

module HomesHelper
  def time_difference(a_time, b_time)
    difference = (a_time - b_time).to_i
    minute = difference / 60
    if minute >= 60
      hour = minute / 60

      if hour >= 12
        day = hour / 12
      end
    end

    if difference >= 3600 * 12
      days = difference / (3600 * 12)
      hours = (difference - (3600 * 12 * days)) / 3600

      res = "#{days}days #{hours}hours"
    elsif difference >= 3600
      hours = difference / 3600
      minutes = (difference - (3600 * hours)) / 60
      res = "#{hours} hours #{minutes} minutes"
    else difference >= 60
      minutes = difference / 60
      res = "#{minutes} minutes"
    end
  end
end
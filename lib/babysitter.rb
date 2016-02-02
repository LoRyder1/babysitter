BEFORE_BEDTIME_PAY = 12
AFTER_BEDTIME_PAY = 8
AFTER_MIDNIGHT_PAY = 16
MIDNIGHT = 24
BEDTIME = 22

class BabySitterPay
  attr_reader :message, :hours
  def initialize start_time, endtime
    @hours = HoursWorkedCalculator.new(start_time, endtime) 
    @message = nil
  end

  def valid_schedule hours
    if hours.start_time < 17
      "Must have start time after 5pm"
    elsif hours.endtime > 28
      "Must have end time before 4am"
    else
      "You have a valid schedule!"
    end
  end

  def calculate_pay hours
    BEFORE_BEDTIME_PAY * (hours.before_bedtime) +
    AFTER_BEDTIME_PAY * (hours.before_midnight) +
    AFTER_MIDNIGHT_PAY * (hours.before_morning)
  end
end

class HoursWorkedCalculator
  attr_reader :start_time, :endtime
  def initialize start_time, endtime 
    @start_time, @endtime = start_time, endtime
  end

  def before_bedtime
    BEDTIME > @endtime ? @endtime - @start_time : BEDTIME - @start_time
  end

  def before_midnight
    @endtime < MIDNIGHT ? @endtime - BEDTIME : MIDNIGHT - BEDTIME
  end

  def before_morning
    @endtime > MIDNIGHT ? @endtime - MIDNIGHT : 0
  end
end

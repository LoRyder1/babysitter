require 'pry'

BEFORE_BEDTIME_PAY = 12
AFTER_BEDTIME_PAY = 8
AFTER_MIDNIGHT_PAY = 16
MIDNIGHT = 24

class BabySitterPay
  attr_reader :message
  def initialize start_time, bedtime, endtime
    @start_time, @bedtime, @endtime = start_time, bedtime, endtime
    @message = nil
    valid_schedule?
  end

  def valid_schedule?
    if @start_time < 17
      @message = "Must have start time after 5pm"
    elsif @endtime > 28
      @message = "Must have end time before 4am"
    else
      @message = "You have a valid schedule!"
    end
  end

  def calculate_pay
    BEFORE_BEDTIME_PAY * (hours_before_bedtime) +
    AFTER_BEDTIME_PAY * (hours_before_midnight) + 
    AFTER_MIDNIGHT_PAY * (hours_after_midnight)
  end

  private
  def hours_before_bedtime
    if @bedtime > @endtime
      @endtime - @start_time
    else
      @bedtime - @start_time
    end
  end

  def hours_before_midnight
    @endtime < MIDNIGHT ? @endtime - @bedtime : MIDNIGHT - @bedtime
  end

  def hours_after_midnight
    @endtime > MIDNIGHT ? @endtime - MIDNIGHT : 0
  end
end

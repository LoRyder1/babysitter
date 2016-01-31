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
    @bedtime - @start_time
  end

  def hours_before_midnight
    @endtime < MIDNIGHT ? @endtime - @bedtime : MIDNIGHT - @bedtime
  end

  def hours_after_midnight
    @endtime > MIDNIGHT ? @endtime - MIDNIGHT : 0
  end
end

# @sitting = BabySitterPay.new(16,22,28)
# @sitting1 = BabySitterPay.new(17,22,29)
# @sitting2 = BabySitterPay.new(17,22,22) 
# @sitting3 = BabySitterPay.new(17,22,23)
# @sitting4 = BabySitterPay.new(17,22,24)
# @sitting5 = BabySitterPay.new(17,22,25)
# @sitting6 = BabySitterPay.new(17,22,28)

# p @sitting2.calculate_pay == 60
# p @sitting3.calculate_pay == 68
# p @sitting4.calculate_pay == 76
# p @sitting5.calculate_pay == 92
# p @sitting6.calculate_pay == 140

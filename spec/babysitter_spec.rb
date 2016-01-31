require 'spec_helper'

describe 'BabySitterPay' do
  before(:each) do
    @sitting2 = BabySitterPay.new(17,22,22) 
    @sitting3 = BabySitterPay.new(17,22,23)
    @sitting4 = BabySitterPay.new(17,22,24)
    @sitting5 = BabySitterPay.new(17,22,25)
    @sitting6 = BabySitterPay.new(17,22,28)
  end

  context 'invalid schedule' do
    it 'start time before 5pm results in invalid schedule' do
      @sitting = BabySitterPay.new(16,22,28)
      expect(@sitting.message).to eq "Must have start time after 5pm"
    end

    it 'end time after 4am results in invalid schedule' do
      @sitting1 = BabySitterPay.new(17,22,29)
      expect(@sitting1.message).to eq "Must have end time before 4am"
    end
  end

end
# p @sitting2.calculate_pay == 60
# p @sitting3.calculate_pay == 68
# p @sitting4.calculate_pay == 76
# p @sitting5.calculate_pay == 92
# p @sitting6.calculate_pay == 140


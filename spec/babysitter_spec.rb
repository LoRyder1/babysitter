require 'spec_helper'

describe 'BabySitterPay' do
  before(:each) do
    @sitting4 = BabySitterPay.new(17,22,24)
    @sitting5 = BabySitterPay.new(17,22,25)
  end

  context 'invalid or valid schedule?' do
    it 'start time before 5pm results in invalid schedule' do
      @sitting = BabySitterPay.new(16,22,28)
      expect(@sitting.message).to eq "Must have start time after 5pm"
    end

    it 'end time after 4am results in invalid schedule' do
      @sitting1 = BabySitterPay.new(17,22,29)
      expect(@sitting1.message).to eq "Must have end time before 4am"
    end

    it 'valid schedule has proper message' do
      @sitting2 = BabySitterPay.new(17,22,22)
      expect(@sitting2.message).to eq "You have a valid schedule!"
    end
  end

  context 'calculating pay for various pay hours' do
    it 'pay for hours upto bedtime' do
      @sitting2 = BabySitterPay.new(17,22,22)
      expect(@sitting2.calculate_pay).to eq 60
    end

    it 'pay for hours after bedtime' do
      @sitting3 = BabySitterPay.new(17,22,23)
      expect(@sitting3.calculate_pay).to eq 68
    end

    it 'pay for hours after midnight' do
      @sitting6 = BabySitterPay.new(17,22,28)
      expect(@sitting6.calculate_pay).to eq 140
    end
  end
end

# p @sitting4.calculate_pay == 76
# p @sitting5.calculate_pay == 92
# p @sitting6.calculate_pay == 140


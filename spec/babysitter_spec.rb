require 'spec_helper'

describe 'BabySitterPay' do
  before(:each) do
    @sitting4 = BabySitterPay.new(17,28)
  end

  context 'invalid or valid schedule?' do
    it 'start time before 5pm results in invalid schedule' do
      @sitting = BabySitterPay.new(16,28)
      expect(@sitting.message).to eq "Must have start time after 5pm"
    end

    it 'end time after 4am results in invalid schedule' do
      @sitting1 = BabySitterPay.new(17,29)
      expect(@sitting1.message).to eq "Must have end time before 4am"
    end

    it 'valid schedule has proper message' do
      @sitting2 = BabySitterPay.new(17,22)
      expect(@sitting2.message).to eq "You have a valid schedule!"
    end
  end

  context 'Calculating hours for babysitting' do
    before(:each) do
      @hours = HoursWorkedCalculator.new(17,28)
    end

    it 'hours before bedtime are calculated' do
      expect(@hours.before_bedtime).to eq 5
    end

    it 'hours before midnight are calculated' do
      expect(@hours.before_midnight).to eq 2
    end

    it 'hours after midnight are calculated' do
      expect(@hours.after_midnight).to eq 4
    end
  end

  context 'Acceptance testing : calculating pay for various pay hours' do
    it 'pay for hours upto bedtime' do
      @sitting2 = BabySitterPay.new(17,22)
      expect(@sitting2.calculate_pay).to eq 60
    end

    it 'pay for hours after bedtime' do
      @sitting3 = BabySitterPay.new(17,23)
      expect(@sitting3.calculate_pay).to eq 68
    end

    it 'pay for hours after midnight' do
      @sitting6 = BabySitterPay.new(17,28)
      expect(@sitting6.calculate_pay).to eq 140
    end
  end
end

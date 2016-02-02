require 'spec_helper'
require 'pry'

describe 'BabySitterPay' do

  context '#valid_schedule' do
    let(:hour_mock) { double('hour_mock') }
    let(:hours) { double('hours') }
    subject { BabySitterPay.new(hour_mock, hour_mock) }

    def set_schedule start, endtime
      allow(hours).to receive_messages(start_time: start, endtime: endtime)
    end


    it 'start time before 5pm results in invalid schedule' do
      set_schedule 16,22
      expect(subject.valid_schedule(hours)).to eq "Must have start time after 5pm"
    end

    it 'end time after 4am results in invalid schedule' do
      set_schedule 17,29
      # @sitting1 = BabySitterPay.new(17,29)
      # @sitting.valid_schedule?      
      expect(subject.valid_schedule(hours)).to eq "Must have end time before 4am"
    end

    xit 'valid schedule has proper message' do
      @sitting2 = BabySitterPay.new(17,22)
      @sitting.valid_schedule?      
      expect(@sitting2.message).to eq "You have a valid schedule!"
    end
  end

  context '#calculate_pay for various pay hours' do

    let(:hour_mock) { double('hour_mock') }
    let(:hours) { double('hours') }

    def set_hours bedtime = 0, midtime = 0, morntime = 0
      allow(hours).to receive_messages(before_bedtime: bedtime, before_midnight: midtime, before_morning: morntime )
    end

    subject { BabySitterPay.new(hour_mock, hour_mock) }

    it 'can calculate a total for 1 hour before bedtime' do
      set_hours 1
      total = subject.calculate_pay(hours)
      expect(total).to eql (12 * 1)
    end

    it 'can calculate multiple hours before bedtime' do
      set_hours 2
      total = subject.calculate_pay(hours)
      expect(total).to eql (12 * 2)
    end

    it 'can calculate hours with different rates' do
      set_hours 2,2
      total = subject.calculate_pay(hours)
      expect(total).to eql (12*2 +8*2)
    end

    it 'can calculate a night with three different rates' do
      set_hours 2,2,2
      total = subject.calculate_pay(hours)
      expect(total).to eql (12*2 + 8*2 + 16*2)
    end
  end
end

describe 'HoursWorkedCalculator' do

  context '#before_bedtime, #before_midnight, #before_morning' do
    let(:hours) { HoursWorkedCalculator.new(17,28) }

    it 'hours before bedtime are calculated' do
      expect(hours.before_bedtime).to eq 5
    end

    it 'hours before midnight are calculated' do
      expect(hours.before_midnight).to eq 2
    end

    it 'hours after midnight are calculated' do
      expect(hours.before_morning).to eq 4
    end
  end
end
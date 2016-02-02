require 'spec_helper'

describe 'BabySitterPay' do
  let(:hour_mock) { double('hour_mock') }
  let(:hours) { double('hours') }
  subject { BabySitterPay.new(hour_mock, hour_mock) }

  context '#valid_schedule' do
    def set_schedule start, endtime
      allow(hours).to receive_messages(start_time: start, endtime: endtime)
    end

    it 'start time before 5pm results in invalid schedule' do
      set_schedule 16,22
      expect(subject.valid_schedule(hours)).to eq "Must have start time after 5pm"
    end

    it 'end time after 4am results in invalid schedule' do
      set_schedule 17,29
      expect(subject.valid_schedule(hours)).to eq "Must have end time before 4am"
    end

    it 'valid schedule has proper message' do
      set_schedule 17,22
      expect(subject.valid_schedule(hours)).to eq "You have a valid schedule!"
    end
  end

  context '#calculate_pay for various pay hours' do
    def set_hours bedtime = 0, midtime = 0, morntime = 0
      allow(hours).to receive_messages(before_bedtime: bedtime, before_midnight: midtime, before_morning: morntime)
    end

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
  let(:hours) { HoursWorkedCalculator.new(17,28) }
  let(:hours1) { HoursWorkedCalculator.new(18,27) }
  let(:hours2) { HoursWorkedCalculator.new(18,23) }

  context '#before_bedtime, #before_midnight, #before_morning' do

    it 'hours before bedtime are calculated' do
      expect(hours.before_bedtime).to eq 5
      expect(hours1.before_bedtime).to eq 4
    end

    it 'hours before midnight are calculated' do
      expect(hours.before_midnight).to eq 2
      expect(hours2.before_midnight).to eq 1
    end

    it 'hours after midnight are calculated' do
      expect(hours.before_morning).to eq 4
      expect(hours1.before_morning).to eq 3
    end
  end
end

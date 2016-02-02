require 'spec_helper'
require 'pry'

describe 'BabySitterPay' do

  # context 'invalid or valid schedule?' do
  #   it 'start time before 5pm results in invalid schedule' do
  #     @sitting = BabySitterPay.new(16,22)
  #     expect(@sitting.message).to eq "Must have start time after 5pm"
  #   end

  #   it 'end time after 4am results in invalid schedule' do
  #     @sitting1 = BabySitterPay.new(17,29)
  #     expect(@sitting1.message).to eq "Must have end time before 4am"
  #   end

  #   it 'valid schedule has proper message' do
  #     @sitting2 = BabySitterPay.new(17,22)
  #     expect(@sitting2.message).to eq "You have a valid schedule!"
  #   end
  # end

  # context 'Calculating hours for babysitting' do
  #   let(:hours) { HoursWorkedCalculator.new(17,28) }

  #   xit 'hours before bedtime are calculated' do
  #     expect(@hours.before_bedtime).to eq 5
  #   end

  #   xit 'hours before midnight are calculated' do
  #     expect(@hours.before_midnight).to eq 2
  #   end

  #   xit 'hours after midnight are calculated' do
  #     expect(@hours.before_morning).to eq 4
  #   end
  # end

  context 'Acceptance testing: calculating pay for various pay hours' do

    let(:arbitrary_time) { 0 }
    let(:hour_mock) { double('hour_mock') }
    let(:hours) { double('hours', before_bedtime: 0, before_midnight: 0, before_morning: 0) }

    def set_hours bedtime = 0, midtime = 0, morntime = 0
    #   let(:hours) { double('hours', before_bedtime: bedtime, before_midnight: midnight, before_morning: morning )}
      allow(hours).to receive_messages(before_bedtime: bedtime, before_midnight: midtime, before_morning: morntime )
    end

    subject { BabySitterPay.new(hour_mock, hour_mock) }

    it 'can calculate a total for 1 hour before bedtime' do
      # allow(hours).to receive_messages(:before_bedtime => 1)
      set_hours 1
      total = subject.calculate_pay(hours)
      expect(total).to eql (12 * 1)
    end

    it 'can calculate multiple hours before bedtime' do
      allow(hours).to receive(:before_bedtime).and_return(2)
      total = subject.calculate_pay(hours)
      expect(total).to eql (12 * 2)
    end

    it 'can calculate hours with different rates' do
      allow(hours).to receive(:before_bedtime).and_return(2)
      allow(hours).to receive(:before_midnight).and_return(2)
      total = subject.calculate_pay(hours)
      expect(total).to eql (12*2 +8*2)
    end

    it 'can calculate a night with three different rates' do
      allow(hours).to receive(:before_bedtime).and_return(2)
      allow(hours).to receive(:before_midnight).and_return(2)
      allow(hours).to receive(:before_morning).and_return(2)
      total = subject.calculate_pay(hours)
      expect(total).to eql (12*2 + 8*2 + 16*2)
    end
  end
end

Given(/^I babysit from (\d+) to (\d+)$/) do |start_time, end_time|
  @sitting = BabySitterPay.new(start_time,end_time)
  hours = @sitting.hours  
  @amount_to_bill = @sitting.calculate_pay(hours)
end

Then(/^I should bill (\d+)$/) do |expected_amount_to_bill|
  expect(@amount_to_bill).to eq expected_amount_to_bill
end

Feature: Babysitter Kata
  In order to get paid for 1 night of work
  I want to calculate my nightly charge
  As a babysitter

  The babysitter:
   - starts no earlier than 5:00PM
   - leaves no later than 4:00AM

  Scenario: One hour at the standard rate 
    Given I babysit from 21 to 22
    Then I should bill 12

  Scenario: Multiple hours at standard rate
    Given I babysit from 17 to 22
    Then I should bill 60

  Scenario: A full night babysitting
    Given I babysit from 17 to 28
    Then I should bill 140
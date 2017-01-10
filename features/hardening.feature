Feature: Hardened server
  # If we also support production cukes, then the :port
  # should be pulled from ../private/hardening.json
  Scenario: SSH as jevon
    Given I try to SSH on localhost:2200 as jevon
    Then I should be able to SSH successfully

  Scenario: SSH as nobody
    Given I try to SSH on localhost:2200 as nobody
    Then I should not be able to SSH successfully

  Scenario: SSH as jevon on the wrong port
    Given I try to SSH on localhost:1234 as jevon
    Then I should not be able to SSH successfully

Feature: Hardened server
  # If we also support production cukes, then the :port
  # should be pulled from ../private/hardening.json
  Scenario: SSH as jevon
    Given I try to SSH on localhost:2200 as jevon
    Then I should be able to SSH successfully

  Scenario: SSH as nobody
    Given I try to SSH on localhost:2200 as nobody
    Then I should not be able to SSH successfully
    And the SSH error should contain "Authentication failed for user nobody@"

  Scenario: SSH as jevon on the wrong port
    Given I try to SSH on localhost:1234 as jevon
    Then I should not be able to SSH successfully
    And the SSH error should contain "Connection refused - connect"

  Scenario: SSH as jevon with an outdated cipher
    Given I try to SSH on localhost:2200 as jevon using 3des-cbc cipher
    Then I should not be able to SSH successfully
    And the SSH error should contain "could not settle on encryption_client algorithm"

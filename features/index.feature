Feature: index.jevon.org
  Scenario: Visit index.jevon.org
    Given I visit localhost on port 8080 with hostname index.jevon.org
    Then I should receive "Hello again, world!"

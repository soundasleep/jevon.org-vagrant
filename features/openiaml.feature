Feature: openiaml.org
  Scenario: Visit openiaml.org
    # TODO maybe this could be
    # 'Given I visit openiaml.org'
    # Which can then be localhost:8080 if it's on Vagrant/VM
    # Or actually going to the actual site if it's on production
    Given I visit localhost:8080 with hostname openiaml.org
    Then I should receive "Internet Application Modelling Language"

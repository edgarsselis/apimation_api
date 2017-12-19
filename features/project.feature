Feature: Project feature
  Test project creation functionality of apimation.com

  Scenario: Collection creation
    Given I login apimation as a regular user
    When I select existing project
    Then I add new collection
  #  And I create new request

  Scenario: Project creation
    Given I login apimation as a regular user
    When I create new project
    Then I add two environments
    And I add global variables
    And I delete created environments



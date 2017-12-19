Feature: Project feature
  Test project creation functionality of apimation.com

  Scenario: Project creation
    Given I login apimation as a regular user
    When I create new project
    Then I add two environments
    And I add global variables
    And I delete created environments

 # Scenario: Collection creation
 #   Given I login apimation as a regular user
 #   Then I add new collection

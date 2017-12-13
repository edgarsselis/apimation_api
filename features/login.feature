Feature: Login feature
  Test login functionality of apimation.com

  Scenario: Positive login
    When I login apimation as a regular user
    Then I check if I am logged in and I can access my personal information

  Scenario: Negative login
    When I try to login apimation with wrong password
    Then I check if I am not logged in and i cannot access my personal data
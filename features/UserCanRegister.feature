Feature: User can register
  As a new user of the Enterprise Kanban
  I want to register as a user
  So that I can user the system

  Scenario: Register the user
    Given I have provided my first name as "Chester"
      And I have provided my last name as "Tester"
      And I have provided my email address as "chester@tester.com"
      And I have provided my password as "chestertester"
    When I register
    Then I will be logged in
      And I will be on my personal page

Scenario: Registering a user requires the first name to be provided
  Given I have provided my last name as "Tester"
    And I have provided my email address as "chester@tester.com"
    And I have provided my password as "chestertester"
  When I register
  Then I will be given a message that says "The first name is required"

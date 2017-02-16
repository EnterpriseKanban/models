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

Scenario: Registering a user requires the last name to be provided
  Given I have provided my first name as "Chester"
    And I have provided my email address as "chester@tester.com"
    And I have provided my password as "chestertester"
  When I register
  Then I will be given a message that says "The last name is required"

Scenario: Registering a user requires the email to be provided
  Given I have provided my first name as "Chester"
    And I have provided my last name as "Tester"
    And I have provided my password as "chestertester"
  When I register
  Then I will be given a message that says "The email is required"

Scenario: Registering a user requires the password to be provided
  Given I have provided my first name as "Chester"
    And I have provided my last name as "Tester"
    And I have provided my email address as "chester@tester.com"
  When I register
  Then I will be given a message that says "The password is required"

Scenario: Registering a user requires the email to be unique
  Given a user registered with first_name="Chester", last_name="Tester", email"chester@tester.com", password="chestertester"
    And I have provided my first name as "Chester2"
    And I have provided my last name as "Tester2"
    And I have provided my email address as "chester@tester.com"
    And I have provided my password as "chester2tester2"
  When I register
    Then I will be given the message "You have already registered with that password"

Feature: Manage Articles
  In order to make a rpg game editor
  As an user
  I want to create and manage characters types
  
  Scenario: Characters List
    Given I have character types named Warrior, Mage
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"

  Scenario: Create Character Type with valid data provided
    Given I have no character types
    And I am on the list of character types
    When I follow "Create Character Type"
    And I fill in "Name" with "Warrior"
    And I press "Create"
    Then I should see "New character type created."
    And I should see "Warrior"
    And I should have 1 character type

  Scenario: Prevent Create Character Type if invalid data provided 
    Given I have no character types
    And I am on the list of character types
    When I follow "Create Character Type"
    And I fill in "Name" with ""
    And I press "Create"
    Then I should see "1 error prohibited this character type from being saved: Name can't be blank Name"
    And I should have 0 character type
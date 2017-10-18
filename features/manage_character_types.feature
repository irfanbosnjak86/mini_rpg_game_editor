Feature: Manage Articles
  In order to make a rpg game editor
  As an user
  I want to create and manage characters types
  
  Scenario: Characters List
    Given I have character types named Warrior, Mage
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"

  Scenario: Create Character Type
    Given I have no character types
    And I am on the list of character types
    When I follow "Create Character Type"
    And I fill in "Name" with "Warrior"
    And I press "Create"
    Then I should see "New character type created."
    And I should see "Warrior"
    And I should have 1 character type
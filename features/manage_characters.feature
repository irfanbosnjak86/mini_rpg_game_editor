Feature: Manage Articles
  In order to make a rpg game editor
  As an user
  I want to create and manage characters
  
  Scenario: Characters List
    Given I have characters named Warrior, Mage
    When I go to the list of characters
    Then I should see "Warrior"
    And I should see "Mage"
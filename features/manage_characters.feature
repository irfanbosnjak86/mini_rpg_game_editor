Feature: Manage Articles
  In order to make a rpg game editor
  As an user
  I want to create and manage characters types
  
  Scenario: Characters List
    Given I have character types named Warrior, Mage
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"
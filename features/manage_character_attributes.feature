Feature: Manage Character Attributes
  In order to manage character attributes
  As an user
  I want to create and manage characters attributes

  Scenario: List Character Attributes
    Given I am loged in as User
    Given I have character types named Warrior, Mage
    Given Charactes have attributes
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"
    And I follow "Warrior"
    Then I should see "Character Attributes"
    And I should see "Name: Speed"
    And I should see "Numerical Value: 30"

  Scenario: Add Character Attribute
    Given I am loged in as User
    Given I have character types named Warrior, Mage
    Given Charactes have attributes
    When I go to the list of character types
    Then I should see "Warrior"
    And I should see "Mage"
    And I follow "Warrior"
    Then I should see "Add Attribute"
    And I fill out the attribute form
    Then I press "Save"
    And I should have 1 more character attribute on "Warrior"

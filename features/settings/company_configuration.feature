Feature: Company Configuration
  In order to ensure view and modify of Company Configuration

  Background:
    Given Application has basic configuration

  Scenario: View "Standard Terms & Conditions of Loan"
    Given I logged in as "admin/secret"
    When I go to the "Settings"
    When I go to the "Company Configuration"
    Then I should see "Company Configuration"

    Given I logged in as "admin@gmail.com"
    When I go to the "Settings/Company Configuration/Standard Terms & Conditions" menu
    Then I should see "Standard Terms & Conditions" header
    And I should see "Edit" link

  Scenario: Edit "Standard Terms & Conditions of Loan"
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings/Company Configuration/Standard Terms & Conditions" menu
    And I click "Edit"
    Then I should see "Edit Standard Terms & Conditions" header
    And I should see "terms" text area
    And I should see "Save" button

  Scenario: Change "Standard Terms & Conditions of Loan"
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings/Company Configuration/Standard Terms & Conditions" menu
    And I click "Edit"
    And Type "New Terms And Conditions" in "terms" text area
    And click "Save"
    Then I should see "Edit Standard Terms & Conditions" header
    And I should see "New Terms And Conditions" text


  Scenario: View "Demand Letter Format"
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings/Company Configuration/Demand Letter Format" menu
    Then I should see "Demand Letter Format" header
    And I should see "Edit" link

  Scenario: Edit "Demand Letter Format"
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings/Company Configuration/Demand Letter Format" menu
    And I click "Edit"
    Then I should see "Edit Demand Letter Format" header
    And I should see "terms" text area
    And I should see "Save" button

  Scenario: Change "Demand Letter Format"
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings/Company Configuration/Demand Letter Format" menu
    And I click "Edit"
    And Type "New Letter Format" in "terms" text area
    And click "Save"
    Then I should see "Edit Demand Letter Format" header
    And I should see "New Letter Format" text


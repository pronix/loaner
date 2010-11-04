@green

Feature: Company Configuration
  In order to ensure view and modify of Company Configuration

  Background:
    Given Basic configuration

  Scenario: View "Standard Terms & Conditions of Loan"
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Company Configuration"
    Then I should see "Company Configuration"
    And I should see "Standard Terms & Conditions of Loan"
    And I should see "Demand Letter Format"

  Scenario: Edit "Standard Terms & Conditions of Loan"
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Company Configuration"
    And I follow "Standard Terms & Conditions of Loan"
    And I follow "Edit"
    Then I should see "Edit 'Standard Terms & Conditions of Loan'"

  Scenario: Change "Standard Terms & Conditions of Loan"
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Company Configuration"
    And I follow "Standard Terms & Conditions of Loan"
    And I follow "Edit"
    And I fill in "Content" with "Some text"
    And I press "Update Document"
    Then I should see "Some text"
    And I should see "Edit"

  Scenario: View "Demand Letter Format"
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Company Configuration"
    Then I should see "Company Configuration"
    And I should see "Demand Letter Format"
    And I should see "Demand Letter Format"

  Scenario: Edit "Demand Letter Format"
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Company Configuration"
    And I follow "Demand Letter Format"
    And I follow "Edit"
    Then I should see "Edit 'Demand Letter Format'"

  Scenario: Change "Demand Letter Format"
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Company Configuration"
    And I follow "Demand Letter Format"
    And I follow "Edit"
    And I fill in "Content" with "Some text"
    And I press "Update Document"
    Then I should see "Some text"
    And I should see "Edit"

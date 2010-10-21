Feature: Loan Calculator
  In order to ensure loan calculations

  Background:
    Given Application has basic configuration

  Scenario: View "Loan Calculator" form
    Given I logged in as "admin/secret"
    When I go to the "Loans/Loan Calculator" menu
    Then I should see the "Loan calculator" form
    And form should contain "Loan Amount" text input field
    And form should contain "Rate of interest" text input field
    And form should contain "% Per" select field
    And form should contain "Simple, Monthly cum Daily Interest (Monthly), Daily (Monthly)" radio buttons
    And form should contain "No of Terms" text field
    And form should contain "Terms Units" select field
    And form should contain "Calculate" button


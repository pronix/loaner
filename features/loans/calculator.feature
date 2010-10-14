Feature: Loan Calculator
  In order to ensure loan calculations

  Scenario: View "Loan Calculator" form
    Given I logged in
    When I go to the "Loans/Loan Calculator" menu
    Then I should see the "Loan calculator" form
    And form should contain "Loan Amount" text input field
    And form should contain "Rate of interest" text input field
    And form should contain "% Per" select field
    And form should contain "Equal,Varied,Simple Interest" radio buttons
    And form should contain "No of Terms" text field
    And form should contain "Terms Units" select field
    And form should contain "Calculate" button

  Scenario: Check Simple Interest for Monthly
    Given I logged in
    When I go to the "Loans/Loan Calculator" menu
    And type 10000 into "Loan Amount" text field
    And type 24 into "Rate of interest" text field
    And select "Simple Interest" radio button
    And type 10 into "No of Terms" text field
    And select "Monthly" in "Terms Units" select field
    And press "Calculate" button
    Then I should see the "Total Interest Payable" and $2000
    And should see "Monthly Installment" and "$1200 per Monthly for 10 monthly"

  Scenario: Check Simple Interest for Weekly
    Given I logged in
    When I go to the "Loans/Loan Calculator" menu
    And type 10000 into "Loan Amount" text field
    And type 24 into "Rate of interest" text field
    And select "Simple Interest" radio button
    And type 10 into "No of Terms" text field
    And select "Monthly" in "Terms Units" select field
    And press "Calculate" button
    Then I should see the "Total Interest Payable" and $2000
    And should see "Weekly Installment" and "$1200 per Weekly for 10 weeks"

  Scenario: Check Simple Interest for Fortnightly
    Given I logged in
    When I go to the "Loans/Loan Calculator" menu
    And type 10000 into "Loan Amount" text field
    And type 24 into "Rate of interest" text field
    And select "Simple Interest" radio button
    And type 10 into "No of Terms" text field
    And select "Fortnightly" in "Terms Units" select field
    And press "Calculate" button
    Then I should see the "Total Interest Payable" and $2000
    And should see "Fornightly Installment" and "$1200 per month for 10 fortnights"

  Scenario: Check Simple Interest for Annually
    Given I logged in
    When I go to the "Loans/Loan Calculator" menu
    And type 10000 into "Loan Amount" text field
    And type 24 into "Rate of interest" text field
    And select "Simple Interest" radio button
    And type 10 into "No of Terms" text field
    And select "Annually" in "Terms Units" select field
    And press "Calculate" button
    Then I should see the "Total Interest Payable" and $2000
    And should see "Annual Installment" and "$1200 per month for 10 years"

  Scenario: Check Monthly Rest (Monthly)
    Given I logged in
    When I go to the "Loans/Loan Calculator" menu
    And type 10000 into "Loan Amount" text field
    And type 48 into "Rate of interest" text field
    And select "Monthly Rest" radio button
    And press "Calculate" button
    Then I should see the "Interest for Monthly Rest: $360"

  Scenario: Check Daily Rest (Monthly)
    Given I logged in
    When I go to the "Loans/Loan Calculator" menu
    And type 10000 into "Loan Amount" text field
    And type 48 into "Rate of interest" text field
    And select "Daily Rest" radio button
    And press "Calculate" button
    And select the due date
	Then I should see the "Interest for Monthly Rest: $X"

  Scenario: Check Monthly cum Daily Rest
    When I go to the "Loans/Loan Calculator" menu
    And type 10000 into "Loan Amount" text field
    And type 48 into "Rate of interest" text field
    And select "Monthly cum Daily Rest" radio button
    And press "Calculate" button
    Then I should see the "Interest for Monthly Rest: $360"


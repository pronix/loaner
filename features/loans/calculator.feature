@green

Feature: Loan Calculator
  In order to ensure loan calculations

  Background:
    Given Application has basic configuration

  Scenario: View "Loan Calculator" form
    Given I logged in as "admin/secret"
    When I go to the "Loan Calculator"
    Then I should see "Loan Calculator"
    And page should contain "Amount" text input field
    And page should contain "Rate Interest" text input field
    And page should contain "Percent Per" select field
    And page should contain "Loan Type Simple, Loan Type Monthly cum Daily, Loan Type Daily" radio buttons
    And page should contain "No of Terms" text input field
    And page should contain "Terms Units" select field
    And page should contain "Calculate" submit field

  Scenario: Check Simple Interest for Monthly
    Given I logged in as "admin/secret"
    When I go to the "Loan Calculator"
    And I choose "Simple"
    And I fill in "Loan Amount" with "10000"
    And I fill in "Rate of Interest" with "24"
    And I select "Annually" from "percent_per"
    And I fill in "No of Terms" with "10"
    And I select "Months" from "Terms Units"
    And I press "Calculate"
    Then I should see "Total Interest Payable: $2,000.00"
    And should see "Monthly Installment: $1,200.00 per Monthly for 10 monthly"

#  Scenario: Check Simple Interest for Weekly
#    Given I logged in
#    When I go to the "Loans/Loan Calculator" menu
#    And type 10000 into "Loan Amount" text field
#    And type 24 into "Rate of interest" text field
#    And select "Simple Interest" radio button
#    And type 10 into "No of Terms" text field
#    And select "Monthly" in "Terms Units" select field
#    And press "Calculate" button
#    Then I should see the "Total Interest Payable" and $2000
#    And should see "Weekly Installment" and "$1200 per Weekly for 10 weeks"
#
#  Scenario: Check Simple Interest for Fortnightly
#    Given I logged in
#    When I go to the "Loans/Loan Calculator" menu
#    And type 10000 into "Loan Amount" text field
#    And type 24 into "Rate of interest" text field
#    And select "Simple Interest" radio button
#    And type 10 into "No of Terms" text field
#    And select "Fortnightly" in "Terms Units" select field
#    And press "Calculate" button
#    Then I should see the "Total Interest Payable" and $2000
#    And should see "Fornightly Installment" and "$1200 per month for 10 fortnights"
#
#  Scenario: Check Simple Interest for Annually
#    Given I logged in
#    When I go to the "Loans/Loan Calculator" menu
#    And type 10000 into "Loan Amount" text field
#    And type 24 into "Rate of interest" text field
#    And select "Simple Interest" radio button
#    And type 10 into "No of Terms" text field
#    And select "Annually" in "Terms Units" select field
#    And press "Calculate" button
#    Then I should see the "Total Interest Payable" and $2000
#    And should see "Annual Installment" and "$1200 per month for 10 years"
#
#  Scenario: Check Monthly Rest (Monthly)
#    Given I logged in
#    When I go to the "Loans/Loan Calculator" menu
#    And type 10000 into "Loan Amount" text field
#    And type 48 into "Rate of interest" text field
#    And select "Monthly Rest" radio button
#    And press "Calculate" button
#    Then I should see the "Interest for Monthly Rest: $360"
#
#  Scenario: Check Daily Rest (Monthly)
#    Given I logged in
#    When I go to the "Loans/Loan Calculator" menu
#    And type 10000 into "Loan Amount" text field
#    And type 48 into "Rate of interest" text field
#    And select "Daily Rest" radio button
#    And press "Calculate" button
#    And select the due date
#    Then I should see the "Interest for Monthly Rest: $X"
#
#  Scenario: Check Monthly cum Daily Rest
#    When I go to the "Loans/Loan Calculator" menu
#    And type 10000 into "Loan Amount" text field
#    And type 48 into "Rate of interest" text field
#    And select "Monthly cum Daily Rest" radio button
#    And press "Calculate" button
#    Then I should see the "Interest for Monthly Rest: $360"
#
#
#
#

@green

Feature: Loan Disbursement
  In order to ensure loan disbursement form

  Background:
    Given Application has basic configuration

  Scenario: Show "Loan Disbursement" form
    Given I logged in as "admin/secret"
    When I go to the "New Loan Disbursement"
    Then I should see "Loan Disbursement"
    And page should contain "Application" text input field
    #And "Application Date" date field should contain current date
    And page should contain "Account No" text input field
    And page should contain "Borrowers" select field
    And page should contain "Sureties" select field
    And page should contain "Loan type" select field
    And page should contain "Amount" text input field
    And page should contain "Bankruptcy declaration" text input field
    And page should contain "Remarks" text area
    And page should contain "Interest Calculation (%)" div
    And page should contain "Permitted Fees" tab 
    And page should contain "Payment Schedule" tab 
    And page should contain "Misc" tab 
    And page should contain "Simple" radio button
    And page should contain "Monthly cum Daily Interest (Monthly)" radio button
    And page should contain "Daily Interest (Monthly)" radio button
    And page should contain "Late Interest (Monthly)" radio button
    #And "Simple Interest Method" select field should contain items "Monthly, Weekly, Fornightly, Annually"
    And page should contain "Acceptance Fees" text input field
    And page should contain "Revolving Credit Approval/Renewal Fees" text input field
    And page should contain "Late Repayment" text input field
    And page should contain "Terms of Contract Variation" text input field
    And page should contain "Cheque Dishonour/Unseccessful GIRO" text input field
    And page should contain "Preclousure/Termination Fees" text input field
    And page should contain "Legal Fees" text input field
    And page should contain "Custom Configuration" radio button
    And page should contain "Monthly" radio button
    And page should contain "Weekly" radio button
    And page should contain "Annually" radio button
    And page should contain "Fornightly" radio button
    And page should contain "Date of First Payment" date field
    And page should contain "Loan Maturity Date" date field
    And page should contain "Grace Period (in days)" text input field
    And page should contain "Terms & Conditions" text input field
    And page should contain "Language Entry" text input field




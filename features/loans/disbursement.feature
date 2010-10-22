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
    And page should contain "Account no" text input field
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
    And page should contain "Simple Interest" radio button
    And "Simple Interest Method" select field should contain items "Monthly, Weekly, Fornightly, Annually"
    And tab "Interest Calculation (%)" should contain "Monthly cum Daily Interest (Monthly)" radio button
    And tab "Interest Calculation (%)" should contain "Daily Interest (Monthly)" radio button
    And tab "Interest Calculation (%)" should contain "Late Interest (Monthly)" radio button
    And tab "Permitted Fees" should contain "Acceptance Fees" text field                                ???
    And tab "Permitted Fees" should contain "Revolving Credit Approval/Renewal Fees" text field         ???
    And tab "Permitted Fees" should contain "Late Repayment" text field                                 ???
    And tab "Permitted Fees" should contain "Terms of Contract Variation" text field                    ???
    #And tab "Permitted Fees" should contain "Cheque Dishonour/Unseccessful GIRO" text field             ???
    #And tab "Permitted Fees" should contain "Preclousure/Termination Fees" text field                   ???
    #And tab "Permitted Fees" should contain "Legal Fees" text field                                     ???
    #And tab "Payment Schedule" should contain "Custom Configuration" radio button
    #And tab "Payment Schedule" should contain "Monthly" radio button
    #And tab "Payment Schedule" should contain "Weekly" radio button
    #And tab "Payment Schedule" should contain "Annually" radio button
    #And tab "Payment Schedule" should contain "Fornightly" radio button
    #And tab "Payment Schedule" should contain "Date of First Payment" date field
    #And tab "Payment Schedule" should contain "Loan Maturity Date" date field
    #And tab "Payment Schedule" should contain "Grace Period (in days)" text field
    #And tab "Misc" should contain "Terms & Conditions" text field                                       ???
    #And tab "Misc" should contain "Language Entry" text field




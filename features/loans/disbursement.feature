Feature: Loan Disbursement
  In order to ensure loan disbursement form

  Scenario: Show "Loan Disbursement" form
    Given I logged in
    When I go to the "Loans/Loan Disbursement" menu
    Then I should see the "Loan Disbursement" form
    And form should contain "Applicatiumberon Date" date field
    And "Application Date" date field should contain current date
    And form should contain "Loan Account No" text input field
    And form should contain "Borrower Details" text field (two)
    And form should contain "Surety Details" text field (two)
    And form should contain "Type of Loan" select field
    And form should contain "Loan Amount" text field
    And form should contain "Bankruptcy Declaration" text area                      ???
    And form should contain "Remarks" text area
    And form should contain tab "Interest Calculation (%)"
    And form should contain tab "Permitted Fees"
    And form should contain tab "Payment Schedule"
    And form should contain tab "Misc"
    And tab "Interest Calculation (%)" should contain "Simple Interest" radio button
    And "Simple Interest Method" select field should contain items "Monthly, Weekly, Fornightly, Annually"
    And tab "Interest Calculation (%)" should contain "Monthly cum Daily Interest (Monthly)" radio button
    And tab "Interest Calculation (%)" should contain "Daily Interest (Monthly)" radio button
    And tab "Interest Calculation (%)" should contain "Late Interest (Monthly)" radion button
    And tab "Permitted Fees" should contain "Acceptance Fees" text field                                ???
    And tab "Permitted Fees" should contain "Revolving Credit Approval/Renewal Fees" text field         ???
    And tab "Permitted Fees" should contain "Late Repayment" text field                                 ???
    And tab "Permitted Fees" should contain "Terms of Contract Variation" text field                    ???
    And tab "Permitted Fees" should contain "Cheque Dishonour/Unseccessful GIRO" text field             ???
    And tab "Permitted Fees" should contain "Preclousure/Termination Fees" text field                   ???
    And tab "Permitted Fees" should contain "Legal Fees" text field                                     ???
    And tab "Payment Schedule" should contain "Custom Configuration" radio button
    And tab "Payment Schedule" should contain "Monthly" radio button
    And tab "Payment Schedule" should contain "Weekly" radio button
    And tab "Payment Schedule" should contain "Annually" radio button
    And tab "Payment Schedule" should contain "Fornightly" radio button
    And tab "Payment Schedule" should contain "Date of First Payment" date field
    And tab "Payment Schedule" should contain "Loan Maturity Date" date field
    And tab "Payment Schedule" should contain "Grace Period (in days)" text field
    And tab "Misc" should contain "Terms & Conditions" text field                                       ???
    And tab "Misc" should contain "Language Entry" text field




Feature: Company Transactions
  In order to ensure Company Transactions
  Background:
    Given Standard application configuration
    And Loans table
      | Account No |  Date      | Amount  | Lone type   | Percent |
      | 1          | 04/02/2010 | 10000   |             | 24      |
      | 2          | 01/05/2010 | 20000   |             | 18      |
    And Borrowers table
      | Borrower Name | Registration No   | Type  |  Phone       | Business Phone   | Home Phone  | Loan No |
      | John Doe      |        5          |       |  +155544444  | +155533333       | +155522222  | 1       |
      | Alex Nine     |        7          |       |  +333333224  | +124352345       | +134455542  | 2       |


  Scenario: View "New Transaction" form
    Given I logged in
    When I go to the "Loans/Company Transactions" menu
    Then I should see "New Transaction" form
    And form should contain labels and fields
      |    Label        |   Field type  |
      | Date            | date          |
      | Receipt         | radio button  |
      | Payment         | radio button  |
      | Book transfer   | radio button  |
      | Amount          | text          |
      | Account         | select        |
      | Save            | submit button |
    And "Date" field should contain today date


  Scenario: Add "New Receipt"
    Given I logged in
    When I go to the "Loans/Company Transactions" menu
    And Click at "Receipt" radio button
    And Type "582.50" in "Amount" text field
    And I select "John Doe" in the "Borrower" select field
    And Click "Save"
    Then I should see "New Transaction Created" message
    And I should see "New Transaction" form

  Scenario: Add "New Payment"
    Given I logged in
    When I go to the "Loans/Company Transactions" menu
    And Click at "Payment" radio button
    And Type "582.50" in "Amount" text field
    And I select "John Doe" in the "Borrower" select field
    And Click "Save"
    Then I should see "New Transaction Created" message
    And I should see "New Transaction" form

  Scenario: Add "Book Transfer"
    Given I logged in
    When I go to the "Loans/Company Transactions" menu
    And Click at "Book Transfer" radio button
    And Type "582.50" in "Amount" text field
    And I select "John Doe" in the "Borrower" select field
    And Click "Save"
    Then I should see "New Transaction Created" message
    And I should see "New Transaction" form

    #One More: "Account Transfer"



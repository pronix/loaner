Feature: Company Transactions
  In order to ensure Company Transactions

  Background:
    Given Persons table
      |    Name       | Mail Address      |  Hand Phone  | Business Phone   | Home Phone  | Annual Income |
      | John Doe      | Baker street      |  +155544444  | +155533333       | +155522222  | 93000         |
      | Alex Nine     | Google street     |  +333333224  | +124352345       | +134963542  | 67000         |
      | Mr.James Bond | Killers street    |  +549875007  | +1007007007      | +139347242  | 99000         |
      | Bill Gates    | Washington D.C.   |  +645656707  | +365745645       | +333435942  | 120000        |
      | Joe Satriani  | Toronto, Canada   |  +993939347  | +444455645       | +536664432  | 970000        |
      | Steve Jobs    | New Zeland        |  23412344734 | +233232323       | +534343441  | 10000         |
    And Loans table
      | Account No | Application  | Amount  | Loan type   | Interest  | No of Terms | Interest Type | Simple Interest Method  | Lender     |  Borrowers             | Sureties                  |
      | 1          | 2008-06-21   | 11000   |             | 20        | 35          | simple        | monthly                 | John Doe   |  Alex Nine             | Bill Gates, Joe Satriani  |
      | 2          | 2008-05-03   | 20000   |             | 18        | 12          | simple        | monthly                 | Steve Jobs |  Bill Gates, Alex Nine | Joe Satriani              |


  Scenario: View "New Transaction" form
    Given I logged in as "admin/secret"
    When I follow "Company Transactions"
    Then I should see "Company Transactions"
    And I should see "New Transaction"
    And page should contain labels and fields
      |    Label        |  Field Type   |   Field Value     |
      | Date            | input         |                   |
      | Receipt         | radio button  |                   |
      | Payment         | radio button  |                   |
      | Book transfer   | radio button  |                   |
      | Amount          | text          |                   |
      | Account         | select        |                   |
      | Save            | submit button |                   |


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



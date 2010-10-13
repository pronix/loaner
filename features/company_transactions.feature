Feature: Company Transactions
  In order to ensure Company Transactions

  Scenario: View "New Transaction" form
    Given I logged in
    When I go to the "Loans/Company Transactions" menu
    Then I should see "New Transaction" form
    And form should contain labels and fields
      |    Label        |     Field type    |
      | Receipt         |   radio button    |
      | Payment         |   radio button    |
      | Book transfer   |   radio button    |
      | Amount          |   text            |
      | Save            |   submit button   |


  Scenario: Add "New Receipt"
    Given I logged in
    When I go to the "Loans/Company Transactions" menu
    And Click at "Receipt" radio button
    And .....
    Then I should see "New Receipt" form
    And form should contain labels and input fields
      | Label       |   Field type  |
      | Borrower    |   select      |
      | Amount      |   text        |
      | Save        |   button      |
    And select field "Borrower" should contain "John Doe" value

  Scenario: Add "Receipt"
    Given I logged in
    When I go to the "Loans/Company Transactions/Receipts" menu
    And Click at "New Receipt" link
    And I select "John Doe" in the "Borrower" select field
    And Type "582.50" in "Amount" field
    And Click "Save"
    Then I should see "Receipts Receipt" form
    And form should contain labels and input fields
      | Label       |   Field type  |
      | Borrower    |   select      |
      | Amount      |   text        |
      | Save        |   button      |


Feature: Company Transactions
  In order to ensure Company Transactions

  Background:
    Given Basic configuration
    And Users table
      | Name       | Username    |         Email        |  Password |
      | John Doe   | john_doe    |  john_doe@gmail.com  |  secret   |
      | Steve Jobs | stevej      |  steve@gmail.com     |  secret   |
    And Books table
      |  Name       |  Lender     |
      |  MainBook   | John Doe    |
      |  SlaveBook  | John Doe    |
      |  StevesBook | Steve Jobs  |
    And Persons table
      |    Name       | Mail Address      |  Hand Phone  | Business Phone   | Home Phone  | Annual Income |
      | Alex Nine     | Google street     |  +333333224  | +124352345       | +134963542  | 67000         |
      | Mr.James Bond | Killers street    |  +549875007  | +1007007007      | +139347242  | 99000         |
      | Bill Gates    | Washington D.C.   |  +645656707  | +365745645       | +333435942  | 120000        |
      | Joe Satriani  | Toronto, Canada   |  +993939347  | +444455645       | +536664432  | 970000        |
      | Steve Jobs    | New Zeland        |  23412344734 | +233232323       | +534343441  | 10000         |
    And Loans table
      | Account No | Application  | Amount  | Loan type   | Interest  | No of Terms | Interest Type | Simple Interest Method  | Book       |  Borrowers             | Sureties                  |
      | 1          | 2008-06-21   | 11000   |             | 20        | 35          | simple        | monthly                 | MainBook   |  Alex Nine             | Bill Gates, Joe Satriani  |
      | 2          | 2008-05-03   | 20000   |             | 18        | 12          | simple        | monthly                 | StevesBook |  Bill Gates, Alex Nine | Joe Satriani              |


  Scenario: View "New Transaction" form
    Given I logged in as "john_doe/secret"
    When I follow "Company Transactions"
    Then I should see "Company Transactions"
    And I follow "New Transaction"
    #And show me the page
    And page should contain labels and fields
      |    Label            |  Field Type   |   Field Value     |
      | Date                | date          |                   |
      | Amount              | text          |                   |
      | Transaction Type    | select        |                   |
      | Source Book         | select        |                   |
      | Destination Book    | select        |                   |
      | Source Account      | select        |                   |
      | Destination Account | select        |                   |


  Scenario: Add "New Receipt"
    Given I logged in as "john_doe/secret"
    When I follow "Company Transactions"
    Then I should see "Company Transactions"
    And I follow "New Transaction"
    And I fill in date field "transaction_date" with "2010-01-01"
    And fill in "Amount" with "100.00"
    And select "Disbursement" from "Transaction Type"
    And select "Account No: 1" from "Target loan"
    And I press "Create Transaction"
    Then I should see "Transaction was successfully created"

  Scenario: Add "New Payment"
    Given I logged in as "john_doe/secret"
    When I follow "Company Transactions"
    Then I should see "Company Transactions"
    And I follow "New Transaction"
    And I fill in date field "transaction_date" with "2010-01-01"
    And fill in "Amount" with "100.00"
    And select "Payment" from "Transaction Type"
    And select "Account No: 1" from "Target loan"
    And I press "Create Transaction"
    Then I should see "Transaction was successfully created"

  Scenario: Add "New Book Transfer"
    Given I logged in as "john_doe/secret"
    When I follow "Company Transactions"
    Then I should see "Company Transactions"
    And I follow "New Transaction"
    And I fill in date field "transaction_date" with "2010-01-01"
    And fill in "Amount" with "100.00"
    And select "Book Transfer" from "Transaction Type"
    And select "MainBook" from "Source Book"
    And select "SlaveBook" from "Destination Book"
    And I press "Create Transaction"
    Then I should see "Transaction was successfully created"

  Scenario: Add "New Account Transfer"
    Given I logged in as "john_doe/secret"
    When I follow "Company Transactions"
    Then I should see "Company Transactions"
    And I follow "New Transaction"
    And I fill in date field "transaction_date" with "2010-01-01"
    And fill in "Amount" with "100.00"
    And select "Book Transfer" from "Transaction Type"
    And select "John Doe" from "Source Account"
    And select "Steve Jobs" from "Destination Account"
    And I press "Create Transaction"
    Then I should see "Transaction was successfully created"


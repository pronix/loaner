Feature: Collection
  In order to ensure Loan Collection feature

  Background:
    Given Loans table
      | Account No |  Date      | Amount  | Lone type   | Percent |
      | 1          | 04/02/2010 | 10000   |             | 24      |
      | 2          | 01/05/2010 | 20000   |             | 18      |
    Given Borrowers table
      | Borrower Name | Address           | Registration No   | Type  |  Phone       | Business Phone   | Home Phone  | Loan No |
      | John Doe      | Baker street      |        5          |       |  +155544444  | +155533333       | +155522222  | 1       |
      | Alex Nine     | Google street     |        7          |       |  +333333224  | +124352345       | +134455542  | 2       |
    Given Payment table
      | Borrower      | Payment Date  | Amount        |     Remarks   |
      | John Doe      | 01/05/2009    | 582.50        |  Remark1      |
      | John Doe      | 01/06/2009    | 582.50        |               |
      | John Doe      | 01/07/2009    | 582.50        |               |
      | John Doe      | 01/08/2009    | 582.50        |               |
      | John Doe      | 01/09/2009    | 582.50        |               |
      | John Doe      | 01/10/2009    | 582.50        |               |
      | John Doe      | 01/11/2009    | 582.50        |               |
      | John Doe      | 01/12/2009    | 582.50        |               |
      | John Doe      | 01/01/2010    | 582.50        |               |
      | John Doe      | 01/02/2010    | 582.50        |               |
      | Alex Nine     | 01/02/2009    | 100.00        |  Remark2      |

  Scenario: Show "Collection" page
    Given I logged in
    When I go to the "Loans/Collection" menu
    Then I should see the "Collection" table
    And headers of table should be
        | Payment Details | Receipt | Loan Status | Remarks |
    And table should contain 2 rows

  Scenario: "Collection" table content
    Given I logged in
    When I go to the "Loans/Collection" menu
    Then I should see the "Collection" table
    And table content should be
        | John Doe  | Name of Lender  | STATUS | Remark1    |                 ???
        | Alex Nine | Name of Lender  | STATUS | Remark2    |                 ???

  Scenario: Link to Payment Details
    Given I logged in
    When I go to the "Loans/Collection" menu
    And Clink to "John Doe"
    Then I should see the "Payment Details" form
    And form should contain "Principal Payment" label
    And "Principal Payment" value should be equal 500.00
    And form should contain "Interest Payment" label
    And "Interest Payment" value should be equal 82.50
    And form should contain "Late Interest" label
    And "Late Interest" value should be equal 00.00                     ???
    And form should contain "Permited Fees" label
    And "Permitted Fees" value should contain  XXX                      ???
    And form should contain "Payment By" label
    And "Payment By" value should contain  XXX                          ???
    And form should contain "Payment Type" label
    And "Payment Type" value should contain  XXX                        ???


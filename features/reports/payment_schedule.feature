#@wip

Feature: Payment Schedule
  In order to ensure Payment Schedule Report

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
      | Account No | Application  | Amount  | Loan type   | Interest  | Interest Type | Lender     |  Borrowers             | Sureties                  |
      | 1          | 04/02/2010   | 10000   |             | 16.5      | simple        | John Doe   |  Alex Nine             | Bill Gates, Joe Satriani  |
      | 2          | 01/05/2010   | 20000   |             | 18        | simple        | Steve Jobs |  Bill Gates, Alex Nine | Joe Satriani              |
    Given Payment table
      | Loan Account No | Payment Date  | Amount        |     Remarks   |
      |  1              | 01/05/2009    | 582.50        |  Remark1      |
      |  1              | 01/06/2009    | 582.50        |               |
      |  1              | 01/07/2009    | 582.50        |               |
      |  1              | 01/08/2009    | 582.50        |               |
      |  1              | 01/09/2009    | 582.50        |               |
      |  1              | 01/10/2009    | 582.50        |               |
      |  1              | 01/11/2009    | 582.50        |               |
      |  1              | 01/12/2009    | 582.50        |               |
      |  1              | 01/01/2010    | 582.50        |               |
      |  1              | 01/02/2010    | 582.50        |               |

  Scenario: View "Payment Schedule" Report
    Given I logged in as "admin/secret"
    When I follow "Reports"
    And I follow "Payment Schedule"
    And I click "Alex Nine"
    Then I should see the "Borrowers List"
    And I should see headers of page
      | Header name       |   Value               |
      | Loan Account No   | 1                     |
      | Borrower Name     | Alex Nine             |
      | Borrower Address  | Baker street          |
      | Loan Date         | 04/02/2010            |
      | Home Phone        | +155522222            |
      | Business Phone    | +155533333            |
      | Hand Phone        | +155544444            |
    And I should see table
      | Payment No        |   Date of Payment     |  Amount    |   Principal    |    Interest   |
      |  1                |   01/05/2009          |  582.50    |   500.00       |    82.50      |
      |  2                |   01/06/2009          |  582.50    |   500.00       |    82.50      |
      |  3                |   01/07/2009          |  582.50    |   500.00       |    82.50      |
      |  4                |   01/08/2009          |  582.50    |   500.00       |    82.50      |
      |  5                |   01/09/2009          |  582.50    |   500.00       |    82.50      |
      |  6                |   01/10/2009          |  582.50    |   500.00       |    82.50      |
      |  7                |   01/11/2009          |  582.50    |   500.00       |    82.50      |
      |  8                |   01/12/2009          |  582.50    |   500.00       |    82.50      |
      |  9                |   01/01/2010          |  582.50    |   500.00       |    82.50      |
      |  10               |   01/02/2010          |  582.50    |   500.00       |    82.50      |
      |  Total            |                       | 5825.00    |  5000.00       |   825.00      |




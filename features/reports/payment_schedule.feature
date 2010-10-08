Feature: Payment Schedule
  In order to ensure Payment Schedule Report

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
      | Payment Date  | Amount        |
      | 01/05/2009    | 582.50        |
      | 01/06/2009    | 582.50        |
      | 01/07/2009    | 582.50        |
      | 01/08/2009    | 582.50        |
      | 01/09/2009    | 582.50        |
      | 01/10/2009    | 582.50        |
      | 01/11/2009    | 582.50        |
      | 01/12/2009    | 582.50        |
      | 01/01/2010    | 582.50        |
      | 01/02/2010    | 582.50        |

  Scenario: View "Payment Schedule" Report
    Given I logged in
    When I go to the "Reports/Payment Schedule" menu
    And I click "John Doe"
    Then I should see the "Borrowers List" Report
    And I should see headers of page
      | Header name       |   Value               |
      | Loan Account No   | 1                     |
      | Borrower Name     | John Doe              |
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




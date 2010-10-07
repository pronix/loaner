Feature: Borrower Reports
  In order to ensure Borrower Reports

  Background:
    Given Loans table
      | Account No |  Date      | Amount  | Lone type   | Percent |
      | 1          | 04/02/2010 | 10000   |             | 24      |
      | 2          | 01/05/2010 | 20000   |             | 18      |
    Given Borrowers table
      | Borrower Name | Registration No   | Type  |  Phone       | Business Phone   | Home Phone  | Loan No |
      | John Doe      |        5          |       |  +155544444  | +155533333       | +155522222  | 1       |
      | Alex Nine     |        7          |       |  +333333224  | +124352345       | +134455542  | 2       |

  Scenario: View "Borrowers List" Report
    Given I logged in
    When I go to the "Reports/Borrowers List" menu
    Then I should see the "Borrowers List" Report
    And I should see table
      | Borrower Name   | Borrower Type | Registration No | Loan Account No | Date of Loan    | Loan Amount   |
      | John Doe        |               |       5         |  1              | 04/02/2010      | 10000         |
      | Alex Nine       |               |       7         |  2              | 01/05/2010      | 20000         |


@green

Feature: Payment Schedule
  In order to ensure Payment Schedule Report

  Background:
    Given Basic configuration
    And Users table
      | Name       | Username    |         Email        |  Password |
      | John Doe   | john_doe    |  john_doe@gmail.com  |  secret   |
      | Steve Jobs | stevej      |  steve@gmail.com     |  secret   |
    And Books table
      |  Name       |  Lender     |
      |  MainBook   | John Doe    |
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
    Given Transactions table
      | Loan Account No |  Type      |    Date       |    Amount     |   Remarks     |
      |  1              | payment    |   2008-07-21  |    $377.14    |               |
      |  1              | payment    |   2008-08-21  |    $377.14    |               |
      |  1              | payment    |   2008-09-21  |    $377.14    |               |
      |  1              | payment    |   2008-10-21  |    $377.14    |               |
      |  1              | payment    |   2008-11-21  |    $377.14    |               |
      |  1              | payment    |   2008-12-21  |    $377.14    |               |
      |  1              | payment    |   2009-01-21  |    $377.14    |               |
      |  1              | payment    |   2009-02-21  |    $377.14    |               |
      |  1              | payment    |   2009-03-21  |    $377.14    |               |
      |  1              | payment    |   2009-04-21  |    $377.14    |               |
      |  1              | payment    |   2009-05-21  |    $377.14    |               |
      |  1              | payment    |   2009-06-21  |    $377.14    |               |
      |  1              | payment    |   2009-07-21  |    $377.14    |               |

  Scenario: View "Payment Schedule" Report
    Given I logged in as "admin/secret"
    When I follow "Reports"
    And I follow "Payment Schedule"
    And I follow "Alex Nine"
    Then I should see "Payment Schedule"
    And I should see headers
      | Loan Account No     | 1                     |
      | Name:               | Alex Nine             |
      | Address:            | Google street         |
      | Loan Date:          | 2008-06-21            |
      | Home Phone:         | +134963542            |
      | Business Phone:     | +124352345            |
      | Hand Phone:         | +333333224            |
    And I should see the table ".payment_schedule"
      | Payment No        |   Date of Payment     |   Amount    |   Principal    |    Interest   |
      |  1                |    2008-07-21         |   $377.14   |   $314.29      |   $62.86      |
      |  2                |    2008-08-21         |   $377.14   |   $314.29      |   $62.86      |
      |  3                |    2008-09-21         |   $377.14   |   $314.29      |   $62.86      |
      |  4                |    2008-10-21         |   $377.14   |   $314.29      |   $62.86      |
      |  5                |    2008-11-21         |   $377.14   |   $314.29      |   $62.86      |
      |  6                |    2008-12-21         |   $377.14   |   $314.29      |   $62.86      |
      |  7                |    2009-01-21         |   $377.14   |   $314.29      |   $62.86      |
      |  8                |    2009-02-21         |   $377.14   |   $314.29      |   $62.86      |
      |  9                |    2009-03-21         |   $377.14   |   $314.29      |   $62.86      |
      |  10               |    2009-04-21         |   $377.14   |   $314.29      |   $62.86      |
      |  11               |    2009-05-21         |   $377.14   |   $314.29      |   $62.86      |
      |  12               |    2009-06-21         |   $377.14   |   $314.29      |   $62.86      |
      |  13               |    2009-07-21         |   $377.14   |   $314.29      |   $62.86      |
      | Total             |                       | $4,902.82   | $4,085.77      |  $817.18      |
        




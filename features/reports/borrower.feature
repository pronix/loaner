@green

Feature: Borrower Reports
  In order to ensure Borrower Reports

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
      |    Name       | Mail Address   | Business Address   |  Hand Phone  | Business Phone   | Home Phone  | Annual Income |
      | Alex Nine     | Google street  |  www               | +333333224   | +124352345       | +134963542  | 67000         |
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

  Scenario: View "Borrowers List" Report
    Given I logged in as "admin/secret"
    When I follow "Reports"
    And I follow "Borrowers List"
    Then I should see "Borrowers List"
    And I should see the table ".borrowers_list"
      | Borrower Name                                                                       | Borrower Type | Personal Identification, incorporation or registration number: | Loan Account No.  | Date of Loan    | Loan Amount   |
      | Alex Nine Hand Phone: +333333224 Business Phone: +124352345 Home Phone: +134963542  |   67000       | Google street                                                  |  1                | 2008-06-21      | $11,000.00    |
      | Bill Gates Hand Phone: +645656707 Business Phone: +365745645 Home Phone: +333435942 |  120000       | Washington D.C.                                                |  2                | 2008-05-03      | $20,000.00    |
      | Alex Nine Hand Phone: +333333224 Business Phone: +124352345 Home Phone: +134963542  |   67000       | Google street                                                  |  2                | 2008-05-03      | $20,000.00    |


@wip

Feature: Submission Reports
  In order to ensure submission reports

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


  Scenario: View "Loan Position" Report
    Given I logged in
    When I go to the "Reports/For Submission" menu
    And select "4" quarter of "2010" in quarter select field
    Then I should see the "Loan Position" Report
    And Page field should contain "Date: labmba {Time.now.strftime "%d/%m/%Y"}"
    And Page field should contain "Statement for 4th Quarter of 2010"
    And Page Headers should be
      | Reference No              |                        |
      | Business Name             |                        |
      | Business Address          |                        |
      | Name of Contract Person   |                        |
      | Designation               |                        |
      | Telephone No              |                        |
    And Table headers should be
      | Header Name     |
      | Particulars     |
      | October         |
      | November        |
      | December        |
      | Quarterly Total |
    And table should contain subtable "Opening loan balance"
      | Secured               |  0.00      |            |  0.00      |            |  0.00      |            |  0.00      |            |
      | Unsecured             |  553500.00 | 553500.00  |  553500.00 | 553500.00  |  553500.00 | 553500.00  |  553500.00 | 553500.00  |
    And table should contain subtable "Add"
      | Secured         |  0.00      |            |  0.00      |            |  0.00      |            |  0.00      |            |
      | Unsecured       |  0.00      | 0.00       |  0.00      | 0.00       |  0.00      | 0.00       |  0.00      | 0.00       |
      | Sub Total       |            | 553500.00  |            | 553500.00  |            | 553500.00  |            | 553500.00  |
    And table should contain subtable "Deduct"
      | Secured         |  0.00      |            |  0.00      |            |  0.00      |            |  0.00      |            |
      | Unsecured       |  0.00      | 0.00       |  0.00      | 0.00       |  0.00      | 0.00       |  0.00      | 0.00       |
      | Sub Total       |            | 0.00       |            | 0.00       |            | 0.00       |            | 0.00       |
    And table should contain subtable "Closing loan balance"
      | Secured         |  0.00      |            |  0.00      |            |  0.00      |            |  0.00      |            |
      | Unsecured       |  0.00      | 0.00       |  0.00      | 0.00       |  0.00      | 0.00       |  0.00      | 0.00       |
      | Sub Total       |  553500.00 | 553500.00  |  553500.00 | 553500.00  |  553500.00 | 553500.00  |  553500.00 | 553500.00  |
       

Feature: Submission Reports
  In order to ensure submission reports

  Background:
    Given loan table
      | Submission  |  Person   | Loan type |
      |             |           |           |

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
       

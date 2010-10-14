Feature: Company Transactions
  In order to ensure Company Transactions
  Background:
    Given Loans table
      | Account No |  Date      | Amount  | Lone type   | Percent |
      | 1          | 04/02/2010 | 10000   |             | 24      |
      | 2          | 01/05/2010 | 20000   |             | 18      |
    Given Borrowers table
      | Borrower Name | Registration No   | Type  |  Phone       | Business Phone   | Home Phone  | Loan No |
      | John Doe      |        5          |       |  +155544444  | +155533333       | +155522222  | 1       |
      | Alex Nine     |        7          |       |  +333333224  | +124352345       | +134455542  | 2       |


  Scenario: Show Backup & Restore form
    Given I logged in
    When I go to the "Backup & Restore Database" menu
    Then I should see "Backup & Restore" form
    And form should contain fields
      |   Label     |    Field Type   |
      | Backup      | button          |
      | RestoreFile | file            |
      | Restore     | button          |


  Scenario: Backup Database
    Given I logged in
    When I go to the "Backup & Restore Database" menu
    And Click to "Backup" button
    Then I should download file

  Scenario: Restore Database
    Given I logged in
    When I go to the "Backup & Restore Database" menu
    And select "data.yml" file in "RestoreFile" file field
    And Click to "Restore" button
    Then I should see "Database restored" message

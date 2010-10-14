Feature: User Rigths
  In order to ensure view and modifications User Rigths

  Background:
    Given Roles table
      | Role              |
      | Admin             |
      | AccountMaster     |
      | Lender            |
      | Surety            |
      | Borrower          |
      | Reports           |
      | LoanApplication   |
      | LoanDisbursement  |
      | LoanRepayment     |
      | Backup            |
    Given Company Profile Settings
      | User                            |  Role           |
      | admin@gmail.com                 |  Admin          |
      | john@gmail.com                  |  Borrower       |
      | alex@gmail.com                  |  AccountMaster  |
      | kale@gmail.com                  |  Surety         |
      | tom@gmail.com                   |  Lender         |

  Scenario: View User Rights
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings/User Rights" menu
    Then I should see "User Rights table"
    And Table should contain
      | User                            |  Role           |
      | admin@gmail.com                 |  Admin          |
      | john@gmail.com                  |  Borrower       |
      | alex@gmail.com                  |  AccountMaster  |
      | kale@gmail.com                  |  Surety         |
      | tom@gmail.com                   |  Lender         |



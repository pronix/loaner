Feature: User Rigths
  In order to ensure view and modifications User Rigths

  Background:
    Given Basic configuration
    And Users table
      | Name          | Username    |         Email       |  Password |
      | John Doe      | john_doe    |  john_doe@gmail.com |  secret   |
      | Steve Jobs    | stevej      |  steve@gmail.com    |  secret   |
      | Joe Satriani  | joe         |  joe@gmail.com      |  secret   |
      | Tom Cruise    | tom         |  tom@gmail.com      |  secret   |
    Given Roles table
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
    Given Users to Roles association
      | Email                           |  Role           |
      | admin@gmail.com                 |  Admin          |
      | john_doe@gmail.com              |  Borrower       |
      | steve@gmail.com                 |  AccountMaster  |
      | joe@gmail.com                   |  Surety         |
      | tom@gmail.com                   |  Lender         |

  Scenario: View User Rights
    Given I logged in as "john_doe/secret"
    When I follow "Settings"
    And I follow "User Rights"
    Then I should see "User Rights table"
    And Table should contain
      | User                            |  Role           |
      | admin@gmail.com                 |  Admin          |
      | john@gmail.com                  |  Borrower       |
      | alex@gmail.com                  |  AccountMaster  |
      | kale@gmail.com                  |  Surety         |
      | tom@gmail.com                   |  Lender         |


      #Should also have three roles.

#Administrator - can access anything, create, modify and delete
#User - can access anything, create and modify but CANNOT delete
#Restricted User - can create and modify but access to different modules restricted by administrator.

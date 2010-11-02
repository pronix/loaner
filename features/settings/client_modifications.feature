@green

Feature: Client Details Modifications
  In order to ensure Client Modifications

  Background:
    Given Persons table
      |    Name       | Mail Address   | Business Address   |  Hand Phone  | Business Phone   | Home Phone  | Annual Income |
      | John Doe      | Baker Street   | New York           |  +155544444  | +155533333       | +155522222  | 93000         |
      | Alex Nine     | Google street  |  www               | +333333224   | +124352345       | +134963542  | 67000         |
    And Loans table
      | Account No | Application  | Amount  | Loan type   | Interest  | Interest Type | Lender     |  Borrowers             | Sureties                  |
      | 1          | 04/02/2010   | 10000   |             | 24        | simple        | John Doe   |  Alex Nine             |                           |

  Scenario: View "Persons" Table
    Given I logged in as "admin/secret"
    When I follow "Settings"
    When I follow "Client Details"
    Then I should see table within ".people"
      |    Name         |
      |  John Doe       |
    And I should see "New Person"


  Scenario: View "Edit Person" form
    Given I logged in as "admin/secret"
    When I follow "Settings"
    When I follow "Client Details"
    And follow "Edit"
    Then I should see "Edit Person"
    And page should contain labels and fields
      |    Label              |  Field Type   |   Field Value     |
      |  Name                 |  input        |   John Doe        |
      |  Birth at             |  input        |                   |
      |  Citizenship          |  input        |                   |
      |  Designation          |  textarea     |                   |
      |  Mail Address         |  textarea     |  Baker Street     |
      |  Business Address     |  textarea     |  New York         |
      |  Business Phone       |  input        |   +155533333      |
      |  Home Phone           |  input        |   +155522222      |
      |  Hand Phone           |  input        |   +155544444      |
      |  Annual Income        |  input        |   93000           |
      |  Email                |  input        |                   |

  Scenario: Modify Person
    Given I logged in as "admin/secret"
    When I follow "Settings"
    When I follow "Client Details"
    And follow "Edit"
    Then I should see "Edit Person"
    And fill in "Name" with "Elen Farmer"
    And fill in "Birth at" with "22.12.1980"
    And fill in "Hand Phone" with "+155599999"
    And fill in "Home Phone" with "+155588888"
    And fill in "Annual Income" with "100000"
    And fill in "Email" with "elen@gmail.com"
    And fill in "Designation" with "Some text"
    And press "Update Person"
    And follow "Edit"
    Then I should see "Edit Person"
    And page should contain labels and fields
      |    Label              |  Field Type   |   Field Value     |
      |  Name                 |  input        |   Elen Farmer     |
      |  Birth at             |  input        |  1980-12-22       |
      |  Designation          |  textarea     |  Some text        |
      |  Mail Address         |  textarea     |  Baker Street     |
      |  Business Address     |  textarea     |  New York         |
      |  Business Phone       |  input        |   +155533333      |
      |  Home Phone           |  input        |   +155588888      |
      |  Hand Phone           |  input        |   +155599999      |
      |  Annual Income        |  input        |   100000          |
      |  Email                |  input        |  elen@gmail.com   |


  Scenario: Delete Person confirmation
    Given I logged in as "admin/secret"
    When I follow "Settings"
    When I follow "Client Details"
    Then "Destroy" link should have confirm

  Scenario: I cant delete person if it have Loan Disbursement and Collection records
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Client Details Modification"
    And I follow "Destroy"
    And I should see "People"
    Then I should see "Person have related loans"

#  Scenario: Delete Person
#    Given I logged in as "admin@gmail.com"
#    When I go to the "Settings / Client Details"
#    And Press "Delete" on "Elton John" row
#    And confirm alert dialog
#    Then I should see "Persons" form
#    And form should contain table
#      |    Name         |   Type        |     Actions       |
#      |  John Doe       |   Borrower    |     Edit, Delete  |
#      |  Alex Nine      |   Borrower    |     Edit, Delete  |
#      |  Jim Morrison   |   Surrety     |     Edit, Delete  |
#    And Form should contain "New Person" link


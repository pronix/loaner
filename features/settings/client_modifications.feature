Feature: Client Details Modifications
  In order to ensure Client Modifications
  Background:
    Given Standard application configuration
    And Borrowers table
      | Borrower Name | Registration No   | Type  |  Hand Phone  | Business Phone   | Home Phone  | Date of Birth |
      | John Doe      |        5          |       |  +155544444  | +155533333       | +155522222  | 01/02/1970    |
      | Alex Nine     |        7          |       |  +333333224  | +124352345       | +134455542  | 20/10/1979    |
    And Surrety table
      | Surrety Name  | Registration No   | Type  |  Hand Phone  | Business Phone   | Home Phone  | Date of Birth |
      | Jim Morrison  |        8          |       |  +155544444  | +155533333       | +155522222  | 08/12/1975    |
      | Elton John    |        9          |       |  +333333224  | +124352345       | +134455542  | 09/05/1969    |


  Scenario: View "Persons" Table
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings / Client Details"
    Then I should see "Persons" form
    And form should contain table
      |    Name         |   Type        |     Actions       |
      |  John Doe       |   Borrower    |     Edit, Delete  |
      |  Alex Nine      |   Borrower    |     Edit, Delete  |
      |  Jim Morrison   |   Surrety     |     Edit, Delete  |
      |  Elton John     |   Surrety     |     Edit, Delete  |
    And Form should contain "New Person" link


  Scenario: View "Edit Person" form
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings / Client Details"
    And Press "Edit" on "John Doe" row
    Then I should see "Edit Person" form
    And form should Labels And Fields
      |    Label              |   Field Value     |  Field Type   |
      |  Name                 |   John Doe        |  text         |
      |  Date of Birth        |   01/02/1970      |  date         |
      |  Citizenship          |   ""              |  text         |
      |  Name of the Company  |   ""              |  text         |
      |  Designation          |   ""              |  text area    |
      |  Mailing Address      |   ""              |  text         |
      |  Business Phone       |   ""              |  text         |
      |  Business Address     |   ""              |  text         |
      |  Country              |   ""              |  select       |
      |  Business Phone       |   +155533333      |  text         |
      |  Home Phone           |   +155522222      |  text         |
      |  Hand Phone           |   +155544444      |  text         |
      |  Email                |   ""              |  text         |
      |  Alternate Email      |   ""              |  text         |
      |  Photo                |   ""              |  image        |
      |  Credit Score         |   ""              |  text         |
      |  Credit Card No       |   ""              |  text         |
      |  Expiry Date          |   ""              |  date         |
      |  CVV No               |   ""              |  text         |
      |  Name on Card         |   ""              |  text         |
      |  Annual Income        |   ""              |  text         |
      |  Name of the Bank     |   ""              |  text         |
      |  Account No           |   ""              |  text         |
    And form should contain "Save" button

  Scenario: Modify Person
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings / Client Details"
    And Press "Edit" on "John Doe" row
    And Type "Elen Farmer" in "Name" field
    And Type "22/12/1980" in "Date of Birth" field
    And Type "+155599999" in "Hand Phone" field
    And Type "+155588888" in "Home Phone" field
    And Click "Save"
    Then I should see "Edit Person" form
    And form should Labels And Fields
      |    Label              |   Field Value     |  Field Type   |
      |  Name                 |   Elen Farmer     |  text         |
      |  Date of Birth        |   22/12/1980      |  date         |
      |  Citizenship          |   ""              |  text         |
      |  Name of the Company  |   ""              |  text         |
      |  Designation          |   ""              |  text area    |
      |  Mailing Address      |   ""              |  text         |
      |  Business Phone       |   ""              |  text         |
      |  Business Address     |   ""              |  text         |
      |  Country              |   ""              |  select       |
      |  Business Phone       |   ""              |  text         |
      |  Home Phone           |   +155522222      |  text         |
      |  Hand Phone           |   +155599999      |  text         |
      |  Email                |   ""              |  text         |
      |  Alternate Email      |   ""              |  text         |
      |  Photo                |   ""              |  image        |
      |  Credit Score         |   ""              |  text         |
      |  Credit Card No       |   ""              |  text         |
      |  Expiry Date          |   ""              |  date         |
      |  CVV No               |   ""              |  text         |
      |  Name on Card         |   ""              |  text         |
      |  Annual Income        |   ""              |  text         |
      |  Name of the Bank     |   ""              |  text         |
      |  Account No           |   ""              |  text         |




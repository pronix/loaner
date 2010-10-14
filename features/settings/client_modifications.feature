Feature: Client Details Modifications
  In order to ensure Client Modifications
  Background:
    Given Standard application configuration
    And Borrowers table
      | Borrower Name | Registration No   | Type  |  Phone       | Business Phone   | Home Phone  | Loan No |
      | John Doe      |        5          |       |  +155544444  | +155533333       | +155522222  | 1       |
      | Alex Nine     |        7          |       |  +333333224  | +124352345       | +134455542  | 2       |
    And Surrety table
      | Surrety Name  | Registration No   | Type  |  Phone       | Business Phone   | Home Phone  |
      | Jim Morrison  |        8          |       |  +155544444  | +155533333       | +155522222  |
      | Elton John    |        9          |       |  +333333224  | +124352345       | +134455542  |


  Scenario: View "Borrowers" Table
    Given I logged in as "admin@gmail.com"
    When I go to the "Settings / Client Details"
    Then I should see "Persons" form
    And form should contain table
      |    Name         |   Type        |     Actions       |
      |  John Doe       |   Borrower    |     Edit, Delete  |
      |  Alex Nine      |   Borrower    |     Edit, Delete  |
      |  Jim Morrison   |   Surrety     |     Edit, Delete  |
      |  Elton John     |   Surrety     |     Edit, Delete  |




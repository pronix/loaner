@green

Feature: Company Profile Settings
  In order to ensure view and modify of Company Profile settings

  Background:
    Given Company Profile Settings
      | Company Name                          |  Morgan Inc                   |
      | Company Logo                          |  morgan.jpg                   |
      | ROM Reference Number                  |  1234566789                   |
      | License Number                        |  1234566789                   |
      | Address                               |  221, Baker Street, London    |
      | Contact Person                        |  Mr. Anderson                 |
      | Contact Person Office Phone Number    |  1234567890                   |
      | Contact Person Mobile Number          |  1555111111                   |
      | Contact Person Fax Number             |  1555222222                   |
      | Contact Person Email                  |  anderson@gmail.com           |

  Scenario: View Company Profile info
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Company Profile"
    Then I should see "Company Name: Morgan Inc"
    And I should see image "morgan.jpg" within ".logo"
    And I should see "ROM Reference Number: 1234566789"
    And I should see "License Number: 1234566789"
    And I should see "Address: 221, Baker Street, London"
    And I should see "Contact Person: Mr. Anderson"
    And I should see "Contact Person Office Phone Number: 1234567890"
    And I should see "Contact Person Mobile Number: 1555111111"
    And I should see "Contact Person Fax Number: 1555222222"
    And I should see "Contact Person Email: anderson@gmail.com"
    And I should see "Edit"

  Scenario: Show "Edit Company Profile" form
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Company Profile"
    And I follow "Edit"
    Then page should contain labels and fields
      | Label                                 | Field Type  |  Value                        |
      | Company Name                          | input       |  Morgan Inc                   |
      | Company Logo                          | input       |  morgan.jpg                   |
      | ROM Reference Number                  | input       |  1234566789                   |
      | License Number                        | input       |  1234566789                   |
      | Address                               | input       |  221, Baker Street, London    |
      | Contact Person                        | input       |  Mr. Anderson                 |
      | Contact Person Office Phone Number    | input       |  1234567890                   |
      | Contact Person Mobile Number          | input       |  1555111111                   |
      | Contact Person Fax Number             | input       |  1555222222                   |
      | Contact Person Email                  | input       |  anderson@gmail.com           |

  Scenario: Modify "Edit Company Profile" form
    Given I logged in as "admin/secret"
    When I follow "Settings"
    And I follow "Company Profile"
    And I follow "Edit"
    And fill in the following:
      | Company Name                          |  Pronix Corp                  |
      | ROM Reference Number                  |  3333333333                   |
      | License Number                        |  4444444444                   |
      | Address                               |  666, Hell Street, London     |
      | Contact Person                        |  Mr. Pronix                   |
      | Contact Person Office Phone Number    |  +5555555555                  |
      | Contact Person Mobile Number          |  +1666666666                  |
      | Contact Person Fax Number             |  +1777777777                  |
      | Contact Person Email                  |  pronix@gmail.com             |
    And attach the file "features/support/pronix.jpg" to "Company Logo"
    And press "Update Company profile"
    Then I should see image "pronix.jpg"
    And I should see "Company Name: Pronix Corp"
    And I should see "ROM Reference Number: 3333333333"
    And I should see "License Number: 4444444444"
    And I should see "Address: 666, Hell Street, London"
    And I should see "Contact Person: Mr. Pronix"
    And I should see "Contact Person Office Phone Number: +5555555555"
    And I should see "Contact Person Mobile Number: +1666666666"
    And I should see "Contact Person Fax Number: +1777777777"
    And I should see "Contact Person Email: pronix@gmail.com"
    And I should see "Edit"


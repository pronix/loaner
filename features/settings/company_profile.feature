Feature: Company Profile Settings
  In order to ensure view and modifications of Company Profile settings

  Background:
    Given Company Profile Settings
      | Company Name                          |  Morgan Inc                   |
      | Company Logo                          |  morgan.jpg                   |
      | ROM Reference Number                  |  1234566789                   |
      | License Number                        |  1234566789                   |
      | Address                               |  221, Baker Street, London    |
      | Contact Person                        |  Mr. Anderson                 |
      | Contact Person Office Phone Nubmer    |  +1234567890                  |
      | Contact Person Mobile Nubmer          |  +1555111111                  |
      | Contact Person Fax Nubmer             |  +1555222222                  |
      | Contact Person Email                  |  anderson@gmail.com           |

  Scenario: View Company Profile info
    Given I logged in
    When I go to the "Settings/Company Profile" menu
    Then I should see Company Logo image "morgan.jpg"
    And I should see "Company Name" as "Morgan Inc"
    And I should see "ROM Reference Nubmer" as "1234566789"
    And I should see "License Number" as "1234566789"
    And I should see "Address" as "221, Baker Street, London"
    And I should see "Contact Person" as "Mr. Anderson"
    And I should see "Contact Office Phone Nubmer" as "+1234567890"
    And I should see "Contact Person Mobile Nubmer" as "+1555111111"
    And I should see "Contact Person Fax Nubmer" as "+1555222222"
    And I should see "Contact Person Email" as "anderson@gmail.com"
    And I should see "Edit" link

  Scenario: Show "Edit Company Profile" form
    Given I logged in
    When I go to the "Settings/Company Profile" menu
    And I click "Edit" link
    Then I should see form with fields and values
      | Field                                 |  Value                        |
      | Company Name                          |  Morgan Inc                   |
      | Company Logo                          |  morgan.jpg                   |
      | ROM Reference Number                  |  1234566789                   |
      | License Number                        |  1234566789                   |
      | Address                               |  221, Baker Street, London    |
      | Contact Person                        |  Mr. Anderson                 |
      | Contact Person Office Phone Nubmer    |  +1234567890                  |
      | Contact Person Mobile Nubmer          |  +1555111111                  |
      | Contact Person Fax Nubmer             |  +1555222222                  |
      | Contact Person Email                  |  anderson@gmail.com           |

  Scenario: Modify "Edit Company Profile" form
    Given I logged in
    When I go to the "Settings/Company Profile" menu
    And I click "Edit" link
    And I change values in fields
      | Field                                 |  Value                        |
      | Company Name                          |  Lenon Corp                   |
      | Company Logo                          |  lenonc.jpg                   |
      | ROM Reference Number                  |  3333333333                   |
      | License Number                        |  4444444444                   |
      | Address                               |  666, Hell Street, London     |
      | Contact Person                        |  Mr. Yandex                   |
      | Contact Person Office Phone Nubmer    |  +5555555555                  |
      | Contact Person Mobile Nubmer          |  +1666666666                  |
      | Contact Person Fax Nubmer             |  +1777777777                  |
      | Contact Person Email                  |  yandex@gmail.com             |
    And Click "Save"
    Then I should see Company Logo image "lenonc.jpg"
    And I should see "Company Name" as "Lenon Corp"
    And I should see "ROM Reference Nubmer" as "3333333333"
    And I should see "License Number" as "4444444444"
    And I should see "Address" as "666, Hell Street, London"
    And I should see "Contact Person" as "Mr. Yandex"
    And I should see "Contact Office Phone Nubmer" as "+5555555555"
    And I should see "Contact Person Mobile Nubmer" as "+1666666666"
    And I should see "Contact Person Fax Nubmer" as "+1777777777"
    And I should see "Contact Person Email" as "yandex@gmail.com"
    And I should see "Edit" link


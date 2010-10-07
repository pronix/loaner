Feature: Menu
  In order to ensure menu navigations

  Scenario: Check main menu
    Given Application ready to work
    And I logged in
    When I go to the main screen
    Then I should see the following menu entries:
      | Menu item               |
      | Loans                   |
      | Company Transactions    |
      | Reports                 |
      | Settings                |

  Scenario: Check "Loans" menu
    Given Application ready to work
    And I logged in
    And I am at main menu
    When I click link "Loans"
    Then I should see the following menu entries:
      | Menu item               |
      | Loan Calculator         |
      | Loan Disbursement       |
      | Collection              |

  Scenario: Check "Company Transactions" menu
    Given Application ready to work
    And I logged in
    And I am at main menu
    When I click link "Company Transactions"
    Then I should see the following menu entries:
      | Menu item           |
      | Receipts            |
      | Payments            |
      | Book Transfer       |
      | Accounts            |

  Scenario: Check "Backup & Restore" menu
    Given Application ready to work
    And I logged in
    And I am at main menu
    When I click link "Backup & Restore"
    Then I should see the following menu entries:
      | Menu item       |
      | Backup          |
      | Restore         |


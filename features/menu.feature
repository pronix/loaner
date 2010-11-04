@green

Feature: Menu
  In order to ensure menu navigations

  Background:
    Given Basic configuration

  Scenario: Check main menu
    Given I logged in as "admin/secret"
    When I go to the "/"
    Then I should see the following menu entries:
      | Menu item               |
      | Loans                   |
      | Company Transactions    |
      | Reports                 |
      | Settings                |
      | Backup & Restore        |

  Scenario: Check "Loans" menu
    Given I logged in as "admin/secret"
    And I go to the "/"
    When I follow "Loans"
    Then I should see the following menu entries:
      | Menu item               |
      | Loan Calculator         |
      | Loan Disbursement       |
      | Collection              |

  Scenario: Check "Company Transactions" menu
    Given I logged in as "admin/secret"
    And I go to the "/"
    When I follow "Company Transactions"
    Then I should see the following menu entries:
      | Menu item           |
      | Receipts            |
      | Payments            |
      | Book Transfer       |
      | Accounts            |

  Scenario: Check "Backup & Restore" menu
    Given I logged in as "admin/secret"
    And I go to the "/"
    When I follow "Backup & Restore"
    Then I should see the following menu entries:
      | Menu item       |
      | Backup          |
      | Restore         |

  Scenario: Check "Settings" menu
    Given I logged in as "admin/secret"
    And I go to the "/"
    When I follow "Settings"
    Then I should see the following menu entries:
      | Menu item                                     |
      | Company Profile                               |
      | User Rights                                   |
      | Company Configuration                         |
      | Client Details Modification                   |

  Scenario: Check "Reports" menu
    Given I logged in as "admin/secret"
    And I go to the "/"
    When I follow "Reports"
    Then I should see the following menu entries:
      | Menu item               |
      | For Submission          |
      | For Records             |
      | Borrower Reports        |
      | Book Statements         |
      | Payment Due Report      |
      | Loan Status             |

  Scenario: Check "Loans/Loan Calculator" submenu

  Scenario: Check "Loans/Loan Disbursement" submenu

  Scenario: Check "Loans/Collection" submenu



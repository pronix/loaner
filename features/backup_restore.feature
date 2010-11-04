@green

Feature: Company Transactions
  In order to ensure Company Transactions

  Background:
    Given Basic configuration

  Scenario: Show Backup & Restore form
    Given I logged in as "admin/secret"
    When I follow "Backup & Restore"
    Then I should see "Backup & Restore"
    And I should see "Download Dump File"
    And I should see "Upload Dump File"

  Scenario: Backup Database
    Given I logged in as "admin/secret"
    When I follow "Backup & Restore"
    And I follow "Download Dump File"
    Then I should see YAML

  Scenario: Restore Database
    Given I logged in as "admin/secret"
    When I follow "Backup & Restore"
    And attach the file "features/support/data.yml" to "file"
    And press "Restore"
    Then I should see "Database restored"

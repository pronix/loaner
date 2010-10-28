@green

Feature: Collection
  In order to ensure Loan Collection feature

  Background:
    Given Persons table
      |    Name       | Mail Address      |  Hand Phone  | Business Phone   | Home Phone  | Annual Income |
      | John Doe      | Baker street      |  +155544444  | +155533333       | +155522222  | 93000         |
      | Alex Nine     | Google street     |  +333333224  | +124352345       | +134963542  | 67000         |
      | Mr.James Bond | Killers street    |  +549875007  | +1007007007      | +139347242  | 99000         |
      | Bill Gates    | Washington D.C.   |  +645656707  | +365745645       | +333435942  | 120000        |
      | Joe Satriani  | Toronto, Canada   |  +993939347  | +444455645       | +536664432  | 970000        |
      | Steve Jobs    | New Zeland        |  23412344734 | +233232323       | +534343441  | 10000         |
    And Loans table
      | Account No | Application  | Amount  | Loan type   | Interest  | Interest Type | Lender     |  Borrowers             | Sureties                  |
      | 1          | 04/02/2010   | 10000   |             | 24        | simple        | John Doe   |  Alex Nine             | Bill Gates, Joe Satriani  |
      | 2          | 01/05/2010   | 20000   |             | 18        | simple        | Steve Jobs |  Bill Gates, Alex Nine | Joe Satriani              |
    Given Payment table
      | Loan Account No | Payment Date  | Amount        |     Remarks   |
      |  1              | 01/05/2009    | 582.50        |  Remark1      |
      |  1              | 01/06/2009    | 582.50        |               |
      |  1              | 01/07/2009    | 582.50        |               |
      |  1              | 01/08/2009    | 582.50        |               |
      |  1              | 01/09/2009    | 582.50        |               |
      |  1              | 01/10/2009    | 582.50        |               |
      |  1              | 01/11/2009    | 582.50        |               |
      |  1              | 01/12/2009    | 582.50        |               |
      |  1              | 01/01/2010    | 582.50        |               |
      |  1              | 01/02/2010    | 582.50        |               |

  Scenario: "Collection" table content
    Given I logged in as "admin/secret"
    When I follow "Loans"
    And I follow "Collection"
    Then I should see "Collection"
    And I should see table within ".loans"
    | Lender            |   Account No  | Amount   | Interest  |
    | John Doe          | 1             | 10000.0  | 24.0      |
    | Steve Jobs        | 2             | 20000.0  | 18.0      |
#And show me the page

#  Scenario: Link to Payment Details
#    Given I logged in as "admin/secret"
#    When I follow "Loans"
#    And I follow "Collection"
#    And I follow "Edit"
#    Then I should see "Payment Details" within "h2"
#    And form should contain "Principal Payment" label
#    And "Principal Payment" value should be equal 500.00
#    And form should contain "Interest Payment" label
#    And "Interest Payment" value should be equal 82.50
#    And form should contain "Late Interest" label
#    And "Late Interest" value should be equal 00.00                     ???
#    And form should contain "Permited Fees" label
#    And "Permitted Fees" value should contain  XXX                      ???
#    And form should contain "Payment By" label
#    And "Payment By" value should contain  XXX                          ???
#    And form should contain "Payment Type" label
#    And "Payment Type" value should contain  XXX                        ???


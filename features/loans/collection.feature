@green

Feature: Collection
  In order to ensure Loan Collection feature

  Background:
    Given Basic configuration
    And Users table
      | Name       | Username    |         Email        |  Password |
      | John Doe   | john_doe    |  john_doe@gmail.com  |  secret   |
      | Steve Jobs | stevej      |  steve@gmail.com     |  secret   |
    And Books table
      |  Name       |  Lender     |
      |  MainBook   | John Doe    |
      |  StevesBook | Steve Jobs  |
    And Persons table
      |    Name       | Mail Address      |  Hand Phone  | Business Phone   | Home Phone  | Annual Income |
      | Alex Nine     | Google street     |  +333333224  | +124352345       | +134963542  | 67000         |
      | Mr.James Bond | Killers street    |  +549875007  | +1007007007      | +139347242  | 99000         |
      | Bill Gates    | Washington D.C.   |  +645656707  | +365745645       | +333435942  | 120000        |
      | Joe Satriani  | Toronto, Canada   |  +993939347  | +444455645       | +536664432  | 970000        |
      | Steve Jobs    | New Zeland        |  23412344734 | +233232323       | +534343441  | 10000         |
    And Loans table
      | Account No | Application  | Amount  | Loan type   | Interest  | No of Terms | Interest Type | Simple Interest Method  | Book       |  Borrowers             | Sureties                  |
      | 1          | 2008-06-21   | 11000   |             | 20        | 35          | simple        | monthly                 | MainBook   |  Alex Nine             | Bill Gates, Joe Satriani  |
      | 2          | 2008-05-03   | 20000   |             | 18        | 12          | simple        | monthly                 | StevesBook |  Bill Gates, Alex Nine | Joe Satriani              |
    And Transactions table
      | Loan Account No |  Type      |  Date         | Amount        |     Remarks   |
      |  1              | payment    | 01/05/2009    | 582.50        |  Remark1      |
      |  1              | payment    | 01/06/2009    | 582.50        |               |
      |  1              | payment    | 01/07/2009    | 582.50        |               |
      |  1              | payment    | 01/08/2009    | 582.50        |               |
      |  1              | payment    | 01/09/2009    | 582.50        |               |
      |  1              | payment    | 01/10/2009    | 582.50        |               |
      |  1              | payment    | 01/11/2009    | 582.50        |               |
      |  1              | payment    | 01/12/2009    | 582.50        |               |
      |  1              | payment    | 01/01/2010    | 582.50        |               |
      |  1              | payment    | 01/02/2010    | 582.50        |               |

  Scenario: "Collection" table content
    Given I logged in as "admin/secret"
    When I follow "Loans"
    And I follow "Collection"
    Then I should see "Collection"
    And show me the page
    And I should see table within ".loans"
    | Lender            |   Account No  | Amount   | Interest  |
    | John Doe          | 1             | 11000.0  | 20.0      |
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


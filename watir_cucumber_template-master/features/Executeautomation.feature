Feature: Test Execute Automation
  In order test Execute Automation Demo site
  @Smoke
  Scenario: Login to execute automation and fill the user form: chrome
    Given I am on execute automation home page
    When I login in with username 'Admin' and password 'Admin'
    And I fill the user form with Title '2' Initial 'Urs' FirstName 'Chiranth' MiddleName 'V'
    And I fill the user form with gender 'female' language 'Hindi' and save the form
    Then I logout of the my account

  @Smoke @Regression
  Scenario: Login to execute automation and fill the user form and handle popup window: chrome
    Given I am on execute automation home page
    When I login in with username 'Admin' and password 'Admin'
    And I fill the user form with Title '2' Initial 'Urs' FirstName 'Chiranth' MiddleName 'V'
    And I fill the user form with gender 'female' language 'Hindi' and save the form
    Then I click on HTML Pop up link enter details Title '2' Initial 'Urs' FirstName 'Chiranth' MiddleName 'V' Gender 'female' Language 'Hindi' and close the pop up

  @Sanity
  Scenario: Login to execute automation and fill the user form and handle popup window: firefox
    Given I am on execute automation home page
    When I login in with username 'Admin' and password 'Admin'
    And I click on Generate I should be able to handle the javascript alert

  @Regression
  Scenario: Login to execute automation and fill the user form for multiple users: chrome
    Given I am on execute automation home page
    When I login in with username 'Admin' and password 'Admin'
    And I fill the form for multiple users as below:
      | Title|Intial|Firstname|MiddleName|
      | 1    |v     |Vinuth   |  Vikram|
      | 2    |B     |Bharath  |  Dutt  |
      | 1    |R     |Vikram   |  Bhat  |
    And I fill the user form with gender 'female' language 'Hindi' and save the form
    Then I logout of the my account

  @Sanity
  Scenario Outline: Login with multiple users: chrome
    Given I am on execute automation home page
    When I login with multiple users "<data_set>" dataset
    Examples:
    |data_set|
    |DataSet1|
    |DataSet2|
    |DataSet3|

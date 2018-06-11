Feature: Test facebook
  In order login to facebook
  Scenario: Login to facebook: internet explorer
    Given I have navigated to facebook
    When I enter username and password and click on login
    Then I should be present in facebook home page
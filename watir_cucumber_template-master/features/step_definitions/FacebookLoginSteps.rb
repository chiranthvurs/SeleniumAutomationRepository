require_relative '../../Pages/login'
require 'selenium-webdriver'
require_relative '../../Assertions/assert'

   Given(/^I have navigated to facebook$/) do
     $loginPage.launchURL "facebook"
   end

   When(/^I enter username and password and click on login$/) do
     $loginPage.enterUsername "chiranthurs@gmail.com"
     $loginPage.enterPassword "Ibmindia123"
     $loginPage.clickLogin
     puts "Success"
   end

   Then(/^I should be present in facebook home page$/) do
    $assert.verifyPageTitle"Facebook"
end

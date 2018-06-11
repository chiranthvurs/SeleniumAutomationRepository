require './Pages/execute_automation_page_ui'
require './Lib/execute_automation_action'

Given(/^I am on execute automation home page$/) do
  $executeAutomationAction = ExecuteAutomationAction.new
  $executeAutomationAction.validateURL
end

When(/^I login in with username '(.*?)' and password '(.*?)'$/) do |username, password|
  $executeAutomationAction.loginWithUsernameAndPassword(username, password)
end

And(/^I fill the user form with Title '(.*?)' Initial '(.*?)' FirstName '(.*?)' MiddleName '(.*?)'$/) do |title, initial,firstname,middlename|
  $executeAutomationAction.fillTheUserForm(title, initial,firstname,middlename)
end

And(/^I fill the user form with gender '(.*?)' language '(.*?)' and save the form$/) do |gender,language|
  $executeAutomationAction.selectGenderAndLanguage(gender,language)
end

Then(/^I logout of the my account$/) do
  $executeAutomationPage.clickLogout.click
end

Then(/^I click on HTML Pop up link enter details Title '(.*?)' Initial '(.*?)' FirstName '(.*?)' MiddleName '(.*?)' Gender '(.*?)' Language '(.*?)' and close the pop up$/) do |title, initial,firstname,middlename,gender,language|
  $executeAutomationAction.handlePopUpMenu(initial,firstname,middlename,gender,language,title)
end

And(/^I click on Generate I should be able to handle the javascript alert$/) do
  $executeAutomationAction.acceptAlert
end

And(/^I fill the form for multiple users as below:$/) do |table|
    table.hashes .each do|data|
      $executeAutomationAction.fillDataForMultipleUsers data
  end
end

When(/^I login with multiple users "([^"]*)" dataset$/) do |data_set_key|
  data_set = data_yml_hash[data_set_key]
  puts data_set
  $executeAutomationAction.loginWithUsernameAndPassword(data_set['Username'], data_set['Password'])
end
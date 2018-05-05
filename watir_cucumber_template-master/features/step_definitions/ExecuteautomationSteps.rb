require_relative '../../Pages/execute_automation_page_ui'

Given(/^I am on execute automation home page$/) do
  $executeAutomationPage.launchURL "executeAutomation"
  $assert.validateURL"http://executeautomation.com/demosite/Login.html"
end

When(/^I login in with username '(.*?)' and password '(.*?)'$/) do |username, password|
  $executeAutomationPage.enterUsername.send_keys(username)
  $executeAutomationPage.enterPassword.send_keys(password)
  $executeAutomationPage.clickLogin.click
  $executeAutomationPage.waitForPageTitle("Execute Automation")
end

And(/^I fill the user form with Title '(.*?)' Initial '(.*?)' FirstName '(.*?)' MiddleName '(.*?)'$/) do |title, initial,firstname,middlename|
  $executeAutomationPage.selectElementFromDropdown($executeAutomationPage.selectTitle,"value",title)
  $executeAutomationPage.enterInitial.send_keys(initial)
  $executeAutomationPage.enterFirstName.send_keys(firstname)
  $executeAutomationPage.enterMiddleName.send_keys(middlename)
end

And(/^I fill the user form with gender '(.*?)' language '(.*?)' and save the form$/) do |gender,language|
  $executeAutomationPage.selectGenderAsFemale.click
  $executeAutomationPage.selectLanguageAsHindi.click
  $executeAutomationPage.clickSave.click
end

Then(/^I logout of the my account$/) do
  $executeAutomationPage.clickLogout.click
end

Then(/^I click on HTML Pop up link enter details Title '(.*?)' Initial '(.*?)' FirstName '(.*?)' MiddleName '(.*?)' and close the pop up$/) do |title, initial,firstname,middlename|
  $executeAutomationPage.clickOnHTMLPopup.click
  $executeAutomationPage.maximizeWindow
  $executeAutomationPage.selectElementFromDropdown($executeAutomationPage.selectTitle,"value",title)
  $executeAutomationPage.enterInitial.send_keys(initial)
  $executeAutomationPage.enterFirstName.send_keys(firstname)
  $executeAutomationPage.enterMiddleName.send_keys(middlename)
  $executeAutomationPage.selectGenderAsFemale.click
  $executeAutomationPage.selectLanguageAsHindi.click
  $executeAutomationPage.clickSave.click
  $executeAutomationPage.clickLogout.click
end

And(/^I click on Generate I should be able to handle the javascript alert$/) do
  $executeAutomationPage.clickOnGenerate.click
  $executeAutomationPage.acceptAlert
  $executeAutomationPage.acceptAlert
end

And(/^I fill the form for multiple users as below:$/) do |table|
  # table is a table.hashes.keys # => [:Title, :Intial, :Firstname, :MiddleName]
  table.hashes .each do|data|
    $executeAutomationPage.selectElementFromDropdown($executeAutomationPage.selectTitle,"value",data['Title'])
    $executeAutomationPage.clearText($executeAutomationPage.enterInitial)
    $executeAutomationPage.enterInitial.send_keys(data['Intial'])
    $executeAutomationPage.clearText($executeAutomationPage.enterFirstName)
    $executeAutomationPage.enterFirstName.send_keys(data['Firstname'])
    $executeAutomationPage.clearText($executeAutomationPage.enterMiddleName)
    $executeAutomationPage.enterMiddleName.send_keys(data['MiddleName'])
  end
end
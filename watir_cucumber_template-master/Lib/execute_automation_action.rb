class ExecuteAutomationAction

  def validateURL
    $executeAutomationPage.launchURL "executeAutomation"
    $assert.validateURL"http://executeautomation.com/demosite/Login.html"
  end

  def loginWithUsernameAndPassword username, password
  $executeAutomationPage.enterUsername.send_keys(username)
  $executeAutomationPage.enterPassword.send_keys(password)
  $executeAutomationPage.clickLogin.click
  $executeAutomationPage.waitForPageTitle("Execute Automation")
  end

  def fillTheUserForm title, initial,firstname,middlename
    $executeAutomationPage.selectElementFromDropdown($executeAutomationPage.selectTitle,"value",title)
    $executeAutomationPage.enterInitial.send_keys(initial)
    $executeAutomationPage.enterFirstName.send_keys(firstname)
    $executeAutomationPage.enterMiddleName.send_keys(middlename)
  end

  def selectGenderAndLanguage gender,language
    $executeAutomationPage.selectGender(gender).click
    $executeAutomationPage.selectLanguage(language).click
    $executeAutomationPage.clickSave.click
  end

  def handlePopUpMenu initial,firstname,middlename,gender,language,title
    $executeAutomationPage.clickOnHTMLPopup.click
    $executeAutomationPage.maximizeWindow
    $executeAutomationPage.selectElementFromDropdown($executeAutomationPage.selectTitle,"value",title)
    $executeAutomationPage.enterInitial.send_keys(initial)
    $executeAutomationPage.enterFirstName.send_keys(firstname)
    $executeAutomationPage.enterMiddleName.send_keys(middlename)
    $executeAutomationPage.selectGender(gender).click
    $executeAutomationPage.selectLanguage(language).click
    $executeAutomationPage.clickSave.click
    $executeAutomationPage.clickLogout.click
  end

  def acceptAlert
    $executeAutomationPage.clickOnGenerate.click
    $executeAutomationPage.acceptAlert
    $executeAutomationPage.acceptAlert
  end

  def fillDataForMultipleUsers data
    $executeAutomationPage.selectElementFromDropdown($executeAutomationPage.selectTitle,"value",data['Title'])
    $executeAutomationPage.clearText($executeAutomationPage.enterInitial)
    $executeAutomationPage.enterInitial.send_keys(data['Intial'])
    $executeAutomationPage.clearText($executeAutomationPage.enterFirstName)
    $executeAutomationPage.enterFirstName.send_keys(data['Firstname'])
    $executeAutomationPage.clearText($executeAutomationPage.enterMiddleName)
    $executeAutomationPage.enterMiddleName.send_keys(data['MiddleName'])
  end

end
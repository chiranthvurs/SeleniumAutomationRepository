class ExecuteAutomationPageUI < Helper

  def enterUsername()
   $expWait.getWhenClickable(:name => "UserName")
  end

  def enterPassword()
    return $expWait.getWhenClickable(:name => "Password")
  end

  def clickLogin()
    return $expWait.getWhenClickable(:xpath => "//input[@name='Login']")
  end

  def selectTitle()
    return $expWait.getWhenClickable(:xpath => "//select[@id='TitleId']")
  end

  def enterInitial()
    return $expWait.getWhenClickable(:id => "Initial")
    
  end

  def enterFirstName()
    return $expWait.getWhenClickable(:id => "FirstName")
  end

  def enterMiddleName()
    return $expWait.getWhenClickable(:id => "MiddleName")
  end

  def selectGenderAsFemale()
    return $expWait.getWhenClickable(:xpath => "//input[@value='female']")
  end

  def selectLanguageAsHindi()
    return $expWait.getWhenClickable(:xpath => "//input[@name='Hindi']")
  end

  def clickSave()
    return $expWait.getWhenClickable(:xpath => "//input[@name='Save']")
  end

  def clickLogout()
    return $expWait.getWhenClickable(:xpath  => "//span[contains(.,'Logout')]")
  end

  def clickOnHTMLPopup
    return $expWait.getWhenClickable(:link  => "HtmlPopup")
  end

  def clickOnGenerate
    return $expWait.getWhenClickable(:xpath  => "//input[@name='generate']")
  end
end

require 'selenium-webdriver'
#===================================== Selenium Waits ================================================================
class SeleniumWait
  def getWhenClickable(locator)
    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    element = wait.until { $driver.find_element(locator) }
    wait.until { element.displayed? }
    wait.until { element.enabled? }
    return element
  end

  def waitForPageTitle(pageTitle)
    $driver.manage.timeouts.page_load = 90
    wait = Selenium::WebDriver::Wait.new(:timeout => 150)
    wait.until { $driver.title.start_with? pageTitle }
  end

  def waitForPageToLoad(timeInSeconds)
    $driver.manage.timeouts.page_load = timeInSeconds
  end

  def waitForAlert
    wait = Wait.new(:timeout => 5)
    wait.until { driver.switch_to.alert }
  end

  def waitLong(timeInSeconds)
    driver.manage.timeouts.implicit_wait = timeInSeconds
  end

end

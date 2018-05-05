require 'selenium-webdriver'
class Login < Helper

  def enterUsername(username)
    $driver.find_element(:id,"email").send_keys(username)
  end

  def enterPassword(password)
    $driver.find_element(:id,"pass").send_keys(password)
  end

  def clickLogin()
    $driver.find_element(:xpath,"//input[@data-testid='royal_login_button']").click
    $driver.manage.timeouts.page_load = 1500
    wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    wait.until
  end
end
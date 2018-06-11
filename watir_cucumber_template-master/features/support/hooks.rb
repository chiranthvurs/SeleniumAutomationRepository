require 'selenium-webdriver'
require 'rspec/expectations'
require './Utilities/selwait'
require './Utilities/helper'
require './Assertions/assert'
require 'yaml'

  Before do
    Selenium::WebDriver.logger.output = 'selenium.log'
    Selenium::WebDriver.logger.level = :info
    $getENV=YAML.load_file'../watir_cucumber_template-master/Config/environment.yml'
    $getURL=YAML.load_file'../watir_cucumber_template-master/Config/urlfactory.yml'
    $machine= $getENV['Remote_Machine1']
  end

  Before('@Smoke') do
   puts "Smoke Test is executing"
  end
#===================================== Configure Environment & Browser ================================================================
  Before do|scenario|
    if $getENV['Remote'].eql?(false)
      #===================================== Local Execution ================================================================
      puts "User has initiated local machine execution"
      if (scenario.name).downcase.include? "chrome"
        Selenium::WebDriver::Chrome.driver_path="../watir_cucumber_template-master/Drivers/chromedriver.exe"
        $driver = Selenium::WebDriver.for :chrome
        $driver.manage.window.maximize()
        puts "Chrome browser launched successfully"

      elsif (scenario.name).downcase.include? "firefox"
        Selenium::WebDriver::Firefox.driver_path="../watir_cucumber_template-master/Drivers/geckodriver.exe"
        $driver = Selenium::WebDriver.for :firefox
        $driver.manage.window.maximize()
        puts "Firefox browser launched successfully"

      elsif (scenario.name).downcase.include? "internet explorer"
        caps = Selenium::WebDriver::Remote::Capabilities.ie
        caps['EnableNativeEvents'] = false
        caps['ignoreZoomSetting'] = true
        $driver = Selenium::WebDriver::IE.driver_path="../watir_cucumber_template-master/Drivers/IEDriverServer.exe"
        $driver = Selenium::WebDriver.for(:ie, desired_capabilities: caps)
        puts "IE browser launched successfully"

      else
        puts "User has not specified any browser"
      end
    else
      #===================================== Remote Execution ================================================================
      puts "User has initiated remote machine execution"
      if (scenario.name).downcase.include? "chrome"
        caps = Selenium::WebDriver::Remote::Capabilities.chrome(
            :version               => "latest",
            :platform              => "VISTA",
            :platformName          => "windows",
        )
        $driver = Selenium::WebDriver.for :remote, url:$machine,:desired_capabilities => caps
        $driver.manage.window.maximize()
        puts "Remote Chrome browser launched successfully"

      elsif (scenario.name).downcase.include? "firefox"
        Selenium::WebDriver::Firefox.driver_path ="../watir_cucumber_template-master/Drivers/geckodriver.exe"
        caps = Selenium::WebDriver::Remote::Capabilities.firefox(
            :version               => "latest",
            :platform              => "VISTA",
            :platformName          => "windows",
            :marionette            => "true",
            :firefox_binary        => "C:/Program Files/Mozilla Firefox/firefox.exe"
            )
        $driver = Selenium::WebDriver.for :remote,url:$machine,:desired_capabilities => caps
        $driver.manage.window.maximize()
        puts "Remote Firefox browser launched successfully"

      elsif (scenario.name).downcase.include? "internet explorer"
        caps = Selenium::WebDriver::Remote::Capabilities.ie(
            :version               => "latest",
            :platform              => "VISTA",
            :platformName          => "windows",
        )
        $driver = Selenium::WebDriver.for :remote, url:$machine,:desired_capabilities => caps
        $driver.manage.window.maximize()
        puts "Remote IE browser launched successfully"
      end
    end
    #============================================ Initialize ==================================================================================
    $assert = Assert.new
    $loginPage = Login.new
    $executeAutomationPage = ExecuteAutomationPageUI.new
    $expWait = SeleniumWait.new
    $driverHelp = Helper.new
    #============================================ Initialize ==================================================================================
  end

  After do |scenario|
    if scenario.failed?
      $driver.save_screenshot scenario.name+".png"
      embed scenario.name+".png", 'image/png'
    end
    $driver.quit
    # scenario.steps.each { |s| puts s.to_sexp }
  end

AfterStep do |scenario|
  # For something that has to be executed after each step
end
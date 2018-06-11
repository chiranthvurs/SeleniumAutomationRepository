require 'selenium-webdriver'
#===================================== Selenium Generic Helpers ================================================================
class Helper < SeleniumWait

  def launchURL (applicationName)
    if applicationName.downcase.eql? "executeautomation"
    $driver.get($getURL['executeAutomationURL'])
    elsif applicationName.downcase.eql? "facebook"
      $driver.get($getURL['facebookURL'])
    end
    $driver.manage.timeouts.page_load = 150
  end

  def selectElementFromDropdown(selectElement, selectorType, option)
    select = Selenium::WebDriver::Support::Select.new(selectElement)
    if selectorType.downcase.eql?("index")
      select.select_by(:index, option)
    end
    if selectorType.downcase.eql?("visibletext")
         select.select_by(:text, option)
    end
    if selectorType.downcase.eql?("value")
           select.select_by(:value, option)
    end
  end

  def maximizeWindow
    $driver.manage.window.maximize()
  end

  def closeCurrentWindow
    $driver.close
  end
  def switchToDefaultContent
    $driver.switch_to.default_content
  end

  def switchToActiveElement
    $driver.switch_to.active_element
  end

  def switchToLastWindow
    $driver.switch_to.window($driver.window_handles.last)
  end

  def switchToFirstWindow
    $driver.switch_to.window($driver.window_handles.first)
  end

  def switchToFrameID frameID
    $driver.switch_to.frame frameID
  end

  def switchBackToParentFrame
    $driver.switch_to.parent_frame
  end

  def acceptAlert
    wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    alert = wait.until { $driver.switch_to.alert }
    alert.accept
  end

  def dismissAlert
    wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    alert = wait.until { $driver.switch_to.alert }
    alert.dismiss
  end

  def clearText (element)
    element.clear
  end

  def enterText(element,data)
    driver.action.click(element).send_keys(data)
  end

  def getText(element)
    return element.text
  end

  def keyBoardActions (actionType)
    if actionType.downcase.eql? "tab"
      $driver.action.send_keys(:tab).perform
    end
    if actionType.downcase.eql? "up"
      $driver.action.send_keys(:up).perform
    end
    if actionType.downcase.eql? "down".perform
      $driver.action.send_keys(:down)
    end
    if actionType.downcase.eql? "enter".perform
      $driver.action.send_keys(:return)
    end
  end

  def doubleClick (element)
    $driver.action.double_click(element).perform
  end

  def rightClickMouse (element)
    $driver.action.context_click(element).perform
  end

  def moveToElement (element)
    $driver.action.move_to(element).perform
  end

  def dragAndDropElementWithOffset(element,y_horizontal,x_vertical)
    $driver.action.drag_and_drop_by(element,y_horizontal,x_vertical).perform
  end

  #Move the mouse to a certain offset from its current position
  def moveMouseToOffset(y_horizontal,x_vertical)
    $driver.action.move_by(y_horizontal, x_vertical).perform
  end
end
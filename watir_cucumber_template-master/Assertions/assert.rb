class Assert
  def validateURL(expectedURL)
    result = false
    if($driver.current_url().eql?(expectedURL))
      result = true
      puts "User has navigated to expected URL"
    else
      puts "User has navigated to an unexpected URL"
    end
    return result
  end

  def verifyPageTitle(expectedTitle)
    result = false
    if($driver.title().eql?(expectedTitle))
      result = true
      puts "User has navigated to user home page"
    else
      puts "User has failed to navigate to home page"
       result = false
    end
    return result
  end

end
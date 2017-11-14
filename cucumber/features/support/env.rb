require 'capybara/cucumber'
require 'selenium/webdriver'
require 'byebug'

@chromedriver_path = "#{Dir.pwd}/bin/chromedriver" 
@geckodriver_path = "#{Dir.pwd}/bin/geckodriver" 

Capybara.register_driver :selenium do |app|
  case ENV['BROWSER']
    when 'firefox'
      Selenium::WebDriver::Firefox::driver_path = @geckodriver_path
      Capybara::Selenium::Driver.new(app, :browser => :firefox)
    when 'chrome'
      Selenium::WebDriver::Chrome::driver_path = @chromedriver_path
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    when 'safari'
      Capybara::Selenium::Driver.new(app, :browser => :safari)
    else
      raise "Unidentified BROWSER. Please set which browser to use. e.g. BROWSER=firefox"
  end
end
Capybara.default_driver = :selenium
Capybara.current_session.driver.browser.manage.window.resize_to(1300, 1100)
Capybara.default_max_wait_time = 10



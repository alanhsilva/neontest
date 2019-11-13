require "capybara/cucumber"
require "capybara/poltergeist"
require "ffaker"
require "json"
require "httparty"
require "rspec"
require "yaml"

@browser = ENV["BROWSER"]

Capybara.configure do |config|
  case @browser
  when "chrome"
    @driver = :selenium_chrome
  when "firefox"
    @driver = :selenium
  when "chrome_headless"
    @driver = :selenium_chrome_headless
  when "firefox_headless"
    @driver = :selenium_headless
  end

  config.default_driver = @driver
  config.default_max_wait_time = 20
  config.default_selector = :xpath
  config.run_server = false
end

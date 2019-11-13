require "selenium-webdriver"

Before do
  @core = Core.new
  @logic = Logic.new
  @home = Home.new
  @question = Questions.new
  @services = Services.new

  Capybara.current_session.driver.browser.manage.delete_all_cookies
  page.driver.browser.manage.window.resize_to(1600, 1600)
  #page.driver.browser.manage.window.maximize
end

require 'capybara/rails'
require 'capybara/rspec'
require 'selenium/webdriver'

# By default Capybara will use Selenium+Firefox for `js:true` feature specs.
# The following lines will tell Capybara to use Chrome instead of Firefox,
Capybara.register_driver :selenium do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(--window-size=1280,1024) },
    loggingPrefs: { browser: 'ALL' }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

# Added browser logging to headless chrome, to read browser error logs please use:
# page.driver.browser.manage.logs.get(:browser)
Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu no-sandbox --window-size=1280,1024) },
    loggingPrefs: { browser: 'ALL' }
  )

  browser_options = ::Selenium::WebDriver::Chrome::Options.new

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: browser_options,
    desired_capabilities: capabilities
  )
end

Capybara.javascript_driver = :headless_chrome

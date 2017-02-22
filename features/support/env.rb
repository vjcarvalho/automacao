require 'rspec'
require 'cucumber'
require 'selenium/webdriver'
require 'capybara/dsl'
require 'pry'

include Capybara::DSL 

Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
	config.current_driver = :selenium
	config.default_max_wait_time = 3
	Capybara.page.driver.browser.manage.window.maximize
end



# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda-matchers'
require 'capybara/rspec'
require 'coveralls'
require 'webmock/rspec'
Coveralls.wear!('rails')

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.include AuthenticationHelper
  config.include StatusHelper

  # Allows you to use focus: true
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end

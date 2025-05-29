require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_paths = [
    "#{::Rails.root}/spec/fixtures",
  ]
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods

  config.before(:each, type: :system) do |example|
    # CI用
    driven_by :selenium, screen_size: [1400, 1400], using: :headless_chrome do |options|
      options.add_argument('--disable-dev-sim-usage')
      options.add_argument('--no-sandbox')
    end
  end
end

require 'bundler/setup'
require 'recurr'
require 'timecop'

# require all supporting files
Dir[File.join(File.expand_path(__dir__), 'support', '**', '*.rb')].sort.each { |file| require file }
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

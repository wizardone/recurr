require 'active_record'
require 'yaml'
RSpec.configure do |config|
  config.before(:suite) do
    db_adapter = ENV['RECURR_DB_ADAPTER'] || 'postgresql'
    config = YAML.load_file(File.expand_path('../database_config.yml', __dir__))[db_adapter]
    ActiveRecord::Base.establish_connection(config.merge('database' => 'postgres'))
    ActiveRecord::Base.connection.create_database(config['database'])

    Dir[File.join(File.expand_path(__dir__), 'migrations', '*.rb')].each { |file| require file}
    [CreatePaymentEvent, CreateRecurringEvents].map(&:up)
  end

  config.after(:suite) do
    # For some reason required with postgres
    [CreatePaymentEvent, CreateRecurringEvents].map(&:down)
    ActiveRecord::Base.connection.drop_database(config['database'])
  end
end

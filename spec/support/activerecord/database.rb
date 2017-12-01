require 'active_record'
require 'yaml'
db_adapter = ENV['RECURR_DB_ADAPTER'] || 'postgresql'
config = YAML.load_file(File.expand_path('../database_config.yml', __dir__))[db_adapter]

ActiveRecord::Base.establish_connection(config)

require 'active_record'
require 'yaml'
db_adapter = ENV['RECURR_DB_ADAPTER'] || 'postgresql'
config = YAML.load_file(File.expand_path('../database_config.yml', __dir__))[db_adapter]

#begin
#  ActiveRecord::Base.connection
#rescue Exception => e
  # Establish connection with the postgres default postgres owner, then create
  # the actual database with the desired name
  ActiveRecord::Base.establish_connection(config.merge('database' => 'postgres'))
  ActiveRecord::Base.connection.create_database(config['database'])
#end

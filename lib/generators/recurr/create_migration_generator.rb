require 'byebug'
module Recurr
  module Generators
    class CreateMigrationGenerator < Rails::Generators::Base

      include Rails::Generators::Migration

      source_root File.expand_path('templates/', __dir__)

      def self.next_migration_number('db/migrate')
        current_migration_number('db/migrate') + 1
      end

      desc %q{Copies the recurring event table migration into the migrations folder}
      def create_migration_file
        migration_template "create_event_migration.rb", "db/migrate/create_recurring_events.rb"
      end
    end
  end
end

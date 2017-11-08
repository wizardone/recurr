module Recurr
  module Generators
    class MigrationGenerator < Rails::Generators::Base

      source_root File.expand_path(__dir__, 'templates/')

      desc %q{Copies the recurring event table migration into the migrations folder}
      def create_migration_file

      end
    end
  end
end

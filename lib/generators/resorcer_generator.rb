require 'rails/generators'
require 'rails/generators/migration'

class ResorcerGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc "Generate classes, migrations, plugins, gems, etc. to run the Resorcer core system."

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  # Plugins
  
  # Migrations
  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template "migrations.rb", "db/migrate/resorcer_core_migration.rb"
  end

end

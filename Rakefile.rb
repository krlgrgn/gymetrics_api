require 'bundler/setup'
require 'active_record'

## Start tasks setup.

# The next few lines of code will allow us to use ActiveRecord tasks like
# db:migrate, etc. outside of rails.

# Redefining the Rails module and overriding the root and env methods to fix the
# errors mentioned here: https://gist.github.com/drogus/6087979
module Rails
  def self.root
    File.dirname(__FILE__)
  end

  def self.env
    ENV['RACK_ENV'] || 'development'
  end
end

include ActiveRecord::Tasks

db_dir = File.expand_path('../db', __FILE__)
config_dir = File.expand_path('../config', __FILE__)

DatabaseTasks.env = ENV['RACK_ENV'] || 'development'
DatabaseTasks.db_dir = db_dir
DatabaseTasks.database_configuration = YAML.load(File.read(File.join(config_dir, 'database.yml')))
DatabaseTasks.migrations_paths = File.join(db_dir, 'migrate')

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env
end

load 'active_record/railties/databases.rake'

## End tasts setup.

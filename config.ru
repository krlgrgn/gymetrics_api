require 'rack'
require 'rack/cors'
require 'grape'
require 'active_record'
require './app'

class User < ActiveRecord::Base
end

class WorkoutProgramme < ActiveRecord::Base
  validates :name, presence: true
end

# Enable ActiveRecord logging.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# DB Connection
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'training_dash.sqlite3')

# Allow CORs
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :any
  end
end

run TrainingDash::API

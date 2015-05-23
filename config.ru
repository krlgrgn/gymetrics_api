require 'rack'
require 'rack/cors'
require 'grape'
require 'active_record'
#require './app'

class User < ActiveRecord::Base
end

class WorkoutPlan < ActiveRecord::Base
end

# DB Connection
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'training_dash.sqlite3')


# Allow CORs
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

module TrainingDash
  class API < Grape::API

    # Version definition
    # Example: http://localhost:9292/v1/xyz123
    version 'v1', using: :path
    format :json

    resources :users do
      # GET /v1/users
      get do
        User.all
      end
    end

    resources :workout_plans do
      # POS /v1/workout_plans
      desc "Creates a new workout plan."
      post do

      end
    end

  end
end

run TrainingDash::API

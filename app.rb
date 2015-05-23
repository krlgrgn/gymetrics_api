module TrainingDash
  class API < Grape::API

    # Version definition
    # Example: http://localhost:9292/v1/xyz123
    version 'v1', using: :path
    format :json

    resources :users do
      # GET /v1/users
      get do
        puts "Inside get"
        puts User.all.inspect
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

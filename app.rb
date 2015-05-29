require 'grape-swagger'

module TrainingDash
  class API < Grape::API
    helpers do
      def logger
        API.logger
      end
    end

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

    resources :workout_programmes do
      # GET /v1/workout_programmes
      get do
        WorkoutProgramme.all
      end

      # POST /v1/workout_programmes
      desc "Creates a new workout plan."
      params do
        requires :name, type: String
      end
      post do
        puts params.inspect
        new_wopr = WorkoutProgramme.new(name: params[:name])

        # If the save was not successful we want to return an error object for
        # the client to consume.
        if !new_wopr.save
          error!(new_wopr.errors.messages, 400)
        end
      end
    end

    # Swagger documentation.
    add_swagger_documentation
  end
end

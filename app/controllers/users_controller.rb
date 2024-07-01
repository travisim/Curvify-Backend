class UsersController < ApplicationController
    # protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    def index
    end
    def login
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
           token = encode({user_id: user.id})
              render json: {user: user, token: token}

        else

            render json: {error: "Invalid username or password"}
        end
    end
    def token_authenticate
       

        token = request.headers["Authenticate"]
        user = User.find(decode(token)["user_id"])
        render json: user
    end
  end
  
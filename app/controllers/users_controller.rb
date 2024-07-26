class UsersController < ApplicationController
    # protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    def index
    end
    def login
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
             token = encode({ user_id: @user.id })
            # Set the JWT in an HttpOnly cookie
            cookies.signed[:jwt] = {
                value: token,
                httponly: true,
                secure: Rails.env.production?, # Ensure secure flag is set in production
                expires: 7.day.from_now
            }
              render json: {user: @user}

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
  
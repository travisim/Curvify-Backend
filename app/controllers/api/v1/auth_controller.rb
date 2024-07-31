
class Api::V1::AuthController < ApplicationController

    skip_before_action :authorized, only: [:login]
    skip_before_action :verify_authenticity_token

    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    skip_before_action :authorized, only: [:login]

    def login 

   
        @user = User.find_by(username: login_params[:username])
        if @user and @user.authenticate(login_params[:password])
            @token = encode_token(user_id: @user.id)
            render json: {
                user: @user, #UserSerializer.new(@user),
                token: @token
            }, status: :accepted
        else
              render json: {error: "Invalid username or password"}
    
        end

    end

    private 

    def login_params 
        params
    end

    def handle_record_not_found(e)
        puts "user not found"
        render json: { message: "User doesn't exist" }, status: :unauthorized
    end
end
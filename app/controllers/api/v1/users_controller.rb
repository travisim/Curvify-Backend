class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  skip_before_action :verify_authenticity_token
  def index
    user = User.all.order(created_at: :desc)
    render json: user
  end

  def create
   
  
     merged_params = user_params.merge({
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    })
    @user = User.new(merged_params)
    puts merged_params.inspect
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      token = encode({ user_id: @user.id })
      # Set the JWT in an HttpOnly cookie
      cookies.signed[:jwt] = {
        value: token,
        httponly: true,
        secure: Rails.env.production?, # Ensure secure flag is set in production
        expires: 1.day.from_now
      }
      render json: { user: @user }, status: :created
    else
      puts @user.errors.full_messages.inspect
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def logout
  # Clear the JWT cookie by setting its expiration to the past
  cookies.delete(:jwt)
  render json: { message: "Logged out successfully" }
  end

  def show
    render json: @user
  end

  def destroy
    @user&.destroy
    render json: { message: 'Post deleted!' }
  end

  private

  def user_params
    params.require(:user).permit(:name,:username,:email, :password ,:password_confirmation)
  end
  def set_user
    @user = User.find(params[:id])
  end
end

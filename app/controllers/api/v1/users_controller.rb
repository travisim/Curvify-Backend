class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]
     skip_before_action :authorized, only: [:create,:me]
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
    if @user.valid?
      @user.save
      @token = encode_token(user_id: @user.id)
        render json: {
            user: @user ,#UserSerializer.new(user), 
            token: @token
        }, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

   def me 
        render json: current_user.as_json(only: [:username, :name, :email,:id]), status: :ok
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
def update 
    if @user.update(user_params)
      render json:  { message: 'User Edited!' }
    else
      render nothing: true, status: :unprocessable_entity
    end
  end
  private

  def user_params
    params.require(:user).permit(:name,:username,:email, :password ,:password_confirmation)
  end
  def set_user
    @user = User.find(params[:id])
  end
end

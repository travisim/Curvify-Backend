class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  skip_before_action :verify_authenticity_token
  def index
    user = User.all.order(created_at: :desc)
    render json: user
  end

  def create
     existing_user_by_username = User.find_by(username: user_params[:username])
    if existing_user_by_username
      puts "user already exists"

      render json: { error: 'Username already exists' } , status: :unprocessable_entity
      return
    end

    existing_user_by_email = User.find_by(email: user_params[:email])
    if existing_user_by_email
      puts "email already exists"

      render json: { error: 'Email already exists' } , status: :unprocessable_entity
      return
    end
    # testUser = User.save(user_params)
    # if testUser.errors[:username] == '["has already been taken"]'
    #   render json: { error: 'Username already taken' }
    # else
     merged_params = user_params.merge({
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    })
    @user = User.new(merged_params)
    puts merged_params.inspect
    if @user.valid?
      @user = User.create(merged_params)

      session[:user_id] = @user.id
      render json: @user, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
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

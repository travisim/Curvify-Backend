class Api::V1::ForumThreadController < ApplicationController
  before_action :set_forumThread, only: %i[show destroy update]
  before_action :get_forumThreadsByCategory, only: %i[showForumThreadsByCategory]
  skip_before_action :authorized, only: [:index,:show,:showForumThreadsByCategory] 

  skip_before_action :verify_authenticity_token

  def index
    forumThread = ForumThread.all.order(created_at: :desc)
    render json: forumThread
  end
  def showForumThreadsByCategory
      
    render json: @forumThreadsByCategory
  end

  def create

    forumThread = ForumThread.create!(forumThread_params)
    if forumThread
      
      render json: forumThread
    else
      
      render json: forumThread.errors

    end
  end
  def update 
    if @forumThread.update(forumThread_params)
      render json:  { message: 'Post Edited!' }
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def show
    render json: @forumThread
  end

  def destroy
    @forumThread&.destroy
    render json: { message: 'Post deleted!' }
  end

  private

  def forumThread_params
    params.require(:forum_thread).permit(:title, :body,:category,:user_id,:author).merge(user: current_user)
  end
  def set_forumThread
    @forumThread = ForumThread.find(params[:id])
  end


  def get_forumThreadsByCategory
    if params[:category] == "All"
      @forumThreadsByCategory  = ForumThread.all.order(created_at: :desc)
    else
    @forumThreadsByCategory  = ForumThread.where(:category => params[:category]).order(created_at: :desc)
    end
  end
end

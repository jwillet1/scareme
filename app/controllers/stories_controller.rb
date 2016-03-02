class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :like, :dislike]

  def index
    @stories = Story.all.order(created_at: :desc).page params[:page]
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user
    if @story.save
      redirect_to @story
    else
      flash[:danger] = @story.errors.full_message.to_sentence
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
    @comments = Comment.where(story_id: params[:id])
  end

  def like
    @story = Story.find(params[:id])
    @story.upvote_by(current_user)
    redirect_to :back
  end

  def dislike
    @story = Story.find(params[:id])
    @story.downvote_by(current_user)
    redirect_to :back
  end

  def search
    params[:search].blank? ? @stories = Story.all : @stories = Story.search(params)
  end

  private
    def story_params
      params.require(:story).permit(:body, :scary, :category_id)
    end
end
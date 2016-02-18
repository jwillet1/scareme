class StoriesController < ApplicationController

  def index
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to @story
    else
      flash[:danger] = @story.errors.full_message.to_sentence
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private
    def story_params
      params.require(:story).permit(:body)
    end
end
class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all
  end
  
  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end
  
  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @user = current_user
    @topic = @user.topics.build(params.require(:topic).permit(:title))
    authorize @topic
    
    @topic.save
    redirect_to @topic
  end
  
  def update
    authorize @topic
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    
    @topic.destroy
    
    redirect_to topics_path
    
  end
  
end
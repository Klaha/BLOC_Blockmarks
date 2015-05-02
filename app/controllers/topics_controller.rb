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
  end

  def create
    @user = current_user
    @topic = @user.topics.build(params.require(:topic).permit(:title))
    @topic.save
    
    redirect_to @topic
  end
  
  def update
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    
    redirect_to topics_path
    
  end
  
end
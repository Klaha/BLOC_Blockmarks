class TopicsController < ApplicationController

  def create
      @user = current_user
      @topic = @user.topics.build(params.require(:topic).permit(:title))
      
      @topic.save
  end
  
end
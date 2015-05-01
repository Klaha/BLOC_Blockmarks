class BookmarksController < ApplicationController

  def create
      @topic = Topic.find(params[:topic_id])
      @bookmark = @topic.bookmarks.build(params.require(:bookmark).permit(:url))
      
      @bookmark.save
  end
  
end
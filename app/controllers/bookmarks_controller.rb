class BookmarksController < ApplicationController
  
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    
    authorize @bookmark
  end

  def create
      @topic = Topic.find(params[:topic_id])
      @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:url))
      @bookmark.topic = @topic
      authorize @bookmark
      
      @bookmark.save
      redirect_to @topic
  end
  
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmarks = Bookmark.find(params[:id])
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    
    @bookmark.destroy
    redirect_to @topic
  end
  
end
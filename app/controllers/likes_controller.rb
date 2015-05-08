class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
 
    if like.save
      flash[:notice] = "Liked!"
      redirect_to @bookmark.topic
    else
      flash[:error] = "There was an error liking the bookmark :("
      redirect_to @bookmark.topic
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "UnLiked!"
      redirect_to @bookmark.topic
    else
      flash[:error] = "There was an error unliking the bookmark :("
      redirect_to @bookmark.topic
    end
  end
  
end

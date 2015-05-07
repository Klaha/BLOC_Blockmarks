class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"
    
    # user = params[:sender]
    # url = params["body-plain"]
    # puts "#{user}"
    # puts "#{url}"
    
    user = User.find_by(email: params[:sender])
    url = params["body-plain"]
    
    if user.present?
      topic = user.topics.find_or_create_by(title: params[:subject])
      new_bookmark = user.bookmarks.build(url: url)
      new_bookmark.topic = topic
      new_bookmark.save
    else
      user = User.new(email: params[:sender], password: "helloworld", password_confirmation: "helloworld") 
      user.skip_confirmation!
      user.save!
      topic = user.topics.find_or_create_by(title: params[:subject])
      new_bookmark = user.bookmarks.build(url: url)
      new_bookmark.topic = topic
      new_bookmark.save
    end

    # Assuming all went well. 
    head 200
  end
end
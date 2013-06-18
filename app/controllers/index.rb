get '/' do
  
  erb :index
end

post '/' do

  tweet = params[:tweet]
  tweet_obj = Tweet.create(:content => params[:tweet], :published_at => Time.now, :user_id => 1)
  Twitter.update(tweet_obj.content)
  redirect back
  unless request.xhr?
    erb :index
  end
  
end

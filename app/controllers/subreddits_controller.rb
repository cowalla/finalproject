class SubredditsController < ApplicationController

  def index
    @subreddits = Subreddit.all 
  end
  
  def show
    @subreddit = Subreddit.find(params[:id])
    @links = @subreddit.links.page(params[:page]).per(6)
  end
  
  def create
    @subreddit = Subreddit.new(params[:subreddit])
    @links = @subreddit.links
    if @subreddit.save
      redirect_to subreddit_url(@subreddit)
    else
      render :json => @subreddit.errors.full_messages
    end
  end
  
  def main
    @subreddit = Subreddit.find(1)
    @links = @subreddit.links.page(params[:page]).per(5)
    render :show
  end

end

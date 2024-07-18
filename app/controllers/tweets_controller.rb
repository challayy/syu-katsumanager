class TweetsController < ApplicationController
    before_action :set_company, only: [:index, :create]
    before_action :set_tweet, only: [:destroy]
    
    def index
        @tweets = @company.tweets
    end
    
    def create
        @tweet = @company.tweets.new(tweet_params)
        if @tweet.save
        redirect_to company_tweets_path(@company), notice: 'Tweet was successfully created.'
        else
        render :index
        end
    end
    
    def destroy
        @tweet.destroy
        redirect_to company_tweets_path(@tweet.company), notice: 'Tweet was successfully destroyed.'
    end
    
    private
    
    def set_company
        @company = Company.find(params[:company_id])
    end
    
    def set_tweet
        @tweet = Tweet.find(params[:id])
    end
    
    def tweet_params
        params.require(:tweet).permit(:content)
    end
end
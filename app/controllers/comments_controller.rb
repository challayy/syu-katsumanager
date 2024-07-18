class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
        redirect_to @tweet, notice: 'コメントが追加されました。'
    else
        redirect_to @tweet, alert: 'コメントの追加に失敗しました。'
    end
end

    private

    def comment_params
    params.require(:comment).permit(:content)
    end
end

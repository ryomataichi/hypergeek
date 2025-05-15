class TweetsController < ApplicationController
  
  def index  
    @tweets = Tweet.all


      @tag = Tag.select("name", "id")
      tag_search = params[:tag_search]
      if tag_search != nil
          @tweets = Tag.find_by(id: tag_search).tweets
      else
          @tweets = Tweet.all
      end
      if params[:tag]
        Tag.create(name: params[:tag])
      end
      @ranking = Tweet.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
      @hosi = Tweet.order(overall: :desc)
    
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweets = Tweet.all
    @comments = @tweet.comments
    @comment = Comment.new
    

    if params[:tag_ids]
      @tweets = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_tweets = Tag.find_by(name: key).tweets
          @tweets = @tweets.empty? ? tag_tweets : @tweets & tag_tweets
        end
      end
    end

    def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy
      redirect_to action: :index
    end

    if params[:tag]
      Tag.create(name: params[:tag])
    end
  end

    def matome
      @tweets = Tweet.all
      @tweet = Tweet.find(params[:id])

      @tag = Tag.select("name", "id")
      tag_search = params[:tag_search]
      if tag_search != nil
          @tweets = Tag.find_by(id: tag_search).tweets
      else
          @tweets = Tweet.all
      end
      if params[:tag]
        Tag.create(name: params[:tag])
      end
      @ranking = Tweet.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
      @hosi = Tweet.order(overall: :desc)
    end

    def search
      @tag_list = Tag.all               # こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
      @tag = Tag.find(params[:tag_id])  # クリックしたタグを取得
      @itirans = @tag.tweets.all           # クリックしたタグに紐付けられた投稿を全て表示
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body, :overall, :level, :kaisuu, :last_posted_date, tag_ids: [])
  end
end
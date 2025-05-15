class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable


  has_many :tweets, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 } 
  has_many :tweets
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  
  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
  private
  
end
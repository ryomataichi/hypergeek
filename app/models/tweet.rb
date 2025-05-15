class Tweet < ApplicationRecord
    belongs_to :user
    after_create :update_user_kaisuu
    has_many :tweet_tag_relations, dependent: :destroy
    has_many :tags, through: :tweet_tag_relations, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy


private


def update_user_kaisuu
    puts "始まったよー！！"
    user = self.user
    today = created_at.to_date
    last_date = user.last_posted_date

    return if last_date == today
#user.last_posted_dateがcreated_at.to_dateと同じならカウントしない。同日に複数投稿して

    puts "同日投稿判定を潜り抜けたよ！"
    if last_date == today - 1
    #user.last_posted_date（前回投稿した日）がcreated_at.to_date（投稿した日）より1低かったら(:例16日に投稿、前回の投稿は15日)なら、
    
    new_kaisuu = user.kaisuu.to_i + 1
    puts "回数が増えたよ！"
    else
    puts "1回目だよ！"
    new_kaisuu = 1
    end


    # 回数にファイナル回数を代入、last_posted_date(前回投稿日)にtoday（今日の日付）を代入。
    user.update!(
    kaisuu: new_kaisuu,
    last_posted_date: today
    )
end
end
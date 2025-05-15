class RemoveLastPostedDateFromTweets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tweets, :last_posted_date, :date
  end
end

class AddLastPostedDateToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :last_posted_date, :date
  end
end

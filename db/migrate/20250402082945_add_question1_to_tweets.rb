class AddQuestion1ToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :question1, :string
  end
end

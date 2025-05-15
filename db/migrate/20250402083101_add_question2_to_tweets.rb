class AddQuestion2ToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :question2, :string
  end
end

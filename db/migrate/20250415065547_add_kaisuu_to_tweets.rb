class AddKaisuuToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :kaisuu, :integer
  end
end

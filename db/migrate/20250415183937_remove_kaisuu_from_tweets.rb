class RemoveKaisuuFromTweets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tweets, :kaisuu, :integer
  end
end

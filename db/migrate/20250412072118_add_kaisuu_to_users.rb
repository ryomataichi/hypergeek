class AddKaisuuToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :kaisuu, :integer
  end
end

class AddBangouToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :bangou, :integer
  end
end

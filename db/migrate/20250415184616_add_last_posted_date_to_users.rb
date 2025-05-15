class AddLastPostedDateToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_posted_date, :date
  end
end

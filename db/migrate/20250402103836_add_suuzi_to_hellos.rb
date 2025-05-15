class AddSuuziToHellos < ActiveRecord::Migration[7.1]
  def change
    add_column :hellos, :suuzi, :string
  end
end

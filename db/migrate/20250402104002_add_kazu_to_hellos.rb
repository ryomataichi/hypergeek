class AddKazuToHellos < ActiveRecord::Migration[7.1]
  def change
    add_column :hellos, :kazu, :string
  end
end

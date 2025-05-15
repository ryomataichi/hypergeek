class CreateHellos < ActiveRecord::Migration[7.1]
  def change
    create_table :hellos do |t|
      t.text :body

      t.timestamps
    end
  end
end

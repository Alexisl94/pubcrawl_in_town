class CreateBars < ActiveRecord::Migration[7.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end

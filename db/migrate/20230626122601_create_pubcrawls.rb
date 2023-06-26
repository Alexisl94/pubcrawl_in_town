class CreatePubcrawls < ActiveRecord::Migration[7.0]
  def change
    create_table :pubcrawls do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :category
      t.integer :nb_max
      t.references :first_bar, null: false, foreign_key: {to_table: :bars}
      t.references :middle_bar, null: false, foreign_key: {to_table: :bars}
      t.references :last_bar, null: false, foreign_key: {to_table: :bars}

      t.timestamps
    end
  end
end

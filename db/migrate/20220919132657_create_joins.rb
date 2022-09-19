class CreateJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :joins do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

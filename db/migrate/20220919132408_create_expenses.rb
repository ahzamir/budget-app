class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name, null: false, limit: 50
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

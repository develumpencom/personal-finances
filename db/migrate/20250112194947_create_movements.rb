class CreateMovements < ActiveRecord::Migration[8.0]
  def change
    create_table :movements do |t|
      t.references :account, null: false, foreign_key: true
      t.date :transaction_date, null: false
      t.date :post_date, null: false
      t.string :description, null: false
      t.integer :amount, null: false
      t.boolean :verified, null: false, default: false

      t.timestamps
    end
  end
end

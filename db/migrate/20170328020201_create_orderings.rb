class CreateOrderings < ActiveRecord::Migration[5.0]
  def change
    create_table :orderings do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end

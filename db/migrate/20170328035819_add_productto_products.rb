class AddProducttoProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :product, :string
  end
end

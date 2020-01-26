class AddShapesToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :shape, :string
  end
end

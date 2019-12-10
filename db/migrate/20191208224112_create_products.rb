class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :img_tag
      t.string :category
      t.float :price
      t.integer :width
      t.integer :height
      t.string :fixing_method

      t.timestamps
    end
  end
end

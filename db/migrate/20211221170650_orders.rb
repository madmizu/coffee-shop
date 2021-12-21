class Orders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :price
      t.references :customer
      t.references :coffee
    end
  end
end

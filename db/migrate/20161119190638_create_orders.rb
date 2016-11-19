class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.decimal :price
      t.string :authentication
      t.string :file

      t.timestamps
    end
  end
end

class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :origin
      t.string :blend
      t.integer :price
      t.datetime :sale_date

      t.timestamps
    end
  end
end

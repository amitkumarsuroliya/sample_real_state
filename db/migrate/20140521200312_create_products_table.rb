class CreateProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :title
      t.text :titlelink
      t.text :price
      t.text :room
      t.text :roomlink
      t.text :area
      t.text :arealink
      t.text :person
      t.text :personlink
      t.text :date

      t.timestamps
    end
  end
end

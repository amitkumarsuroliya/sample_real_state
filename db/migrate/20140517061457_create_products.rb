class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :titlelink
      t.string :price
      t.string :room
      t.string :roomlink
      t.string :area
      t.string :arealink
      t.string :person
      t.string :personlink
      t.string :updated_at

      t.timestamps
    end
  end
end

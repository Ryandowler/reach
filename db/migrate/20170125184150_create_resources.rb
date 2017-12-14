class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :tittle
      t.text :reason
      t.decimal :price

      t.timestamps null: false
    end
  end
end

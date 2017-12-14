class AddBookIdToResource < ActiveRecord::Migration
  def change
    add_column :resources, :book_id, :integer
  end
end

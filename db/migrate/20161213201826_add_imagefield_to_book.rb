class AddImagefieldToBook < ActiveRecord::Migration
  def change
    add_column :books, :my_file, :string
  end
end

class AddAddressToBooks < ActiveRecord::Migration
  def change
    add_column :books, :address, :string
  end
end

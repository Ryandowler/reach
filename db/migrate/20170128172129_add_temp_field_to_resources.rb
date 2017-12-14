class AddTempFieldToResources < ActiveRecord::Migration
  def change
    add_column :resources, :temp_field, :string
  end
end

class AddTypeAndNameToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :type, :string
    add_column :entities, :first_name, :string
    add_column :entities, :last_name, :string
  end
end

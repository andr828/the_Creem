class AddBusinessNameToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :business_name, :string
  end
end

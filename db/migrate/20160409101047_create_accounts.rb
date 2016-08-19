class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.text :metadata
      t.references :entity, index: true

      t.timestamps
    end
  end
end

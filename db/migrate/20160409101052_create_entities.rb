class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.text :metadata
      t.references :user, index: true

      t.timestamps
    end
  end
end

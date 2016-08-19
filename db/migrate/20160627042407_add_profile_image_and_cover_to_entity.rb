class AddProfileImageAndCoverToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :profile_image_id, :string
    add_column :entities, :profile_cover_id, :string
  end
end

# == Schema Information
#
# Table name: entities
#
#  id               :integer          not null, primary key
#  metadata         :text
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#  type             :string
#  first_name       :string
#  last_name        :string
#  profile_image_id :string
#  profile_cover_id :string
#  business_name :string
#

require 'rails_helper'

RSpec.describe Entity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

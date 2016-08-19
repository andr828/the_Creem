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

class Employer < Entity
  attachment :profile_image, type: :image
  attachment :profile_cover, type: :image

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================
  validates_presence_of :business_name

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================


end

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
#


class Candidate < Entity
  attachment :profile_image, type: :image

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================



end

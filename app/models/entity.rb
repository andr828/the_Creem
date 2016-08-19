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
#  business_name    :string
#

class Entity < ActiveRecord::Base
  attachment :profile_image, type: :image
  attachment :profile_cover, type: :image

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================
  serialize :metadata, Hash

  # == Relationships ========================================================
  belongs_to  :user
  has_one     :account

  # == Validations ==========================================================
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :type
  validates_presence_of :account

  # == Scopes ===============================================================

  # == Callbacks ============================================================
  before_validation :create_account

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  private

  def create_account
    self.account = Account.new
  end

end

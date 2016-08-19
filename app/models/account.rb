# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  metadata     :text
#  entity_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#  account_type :string
#

class Account < ActiveRecord::Base
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :entity

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================


end

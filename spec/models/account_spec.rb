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

require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

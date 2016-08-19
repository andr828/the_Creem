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

FactoryGirl.define do
  factory :account do
    account_type ""
    metadata "MyText"
    entity nil
  end
end

# == Schema Information
#
# Table name: industries
#
#  id         :integer          not null, primary key
#  name       :string
#  metadata   :text
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :industry do
    name "MyString"
    metadata "MyText"
  end
end

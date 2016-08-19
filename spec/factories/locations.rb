# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  metadata   :text
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :location do
    metadata "MyText"
  end
end

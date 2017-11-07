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

FactoryGirl.define do
  factory :entity do
    sequence(:first_name) { |n| "first#{n}" }
    sequence(:last_name) { |n| "last#{n}" }
    user nil
    account nil

    trait :employer do
      type :Employer
      business_name :the_creem
    end

    trait :candidate do
      type :Candidate
    end

    trait :candidate do
      type :Candidate
    end

    factory :entity_candidate, traits: [:candidate]
    factory :entity_employer, traits: [:employer]
  end
end

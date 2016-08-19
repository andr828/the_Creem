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

require 'rails_helper'

RSpec.describe Industry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

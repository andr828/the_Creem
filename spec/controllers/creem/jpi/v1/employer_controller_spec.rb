require 'rails_helper'

RSpec.describe Creem::Jpi::V1::EmployerController, type: :controller do

  describe 'PUT #update' do
    context 'with valid attributes' do
      login_employer
      let(:employer) { FactoryGirl.create(:entity_employer) }
      let(:test_image) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'logo.png'), 'image/png') }
      let(:test_cover) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'logo.png'), 'image/png') }
      it 'updates the employer profile' do
        put :update, id: employer, employer: FactoryGirl.attributes_for(:entity_employer, first_name: 'Rainard', profile_image: test_image, profile_cover: test_cover)

        modifed_candidate = Entity.where(first_name: 'Rainard').first
        expect(modifed_candidate).to be_present
        expect(modifed_candidate.profile_image).not_to be_nil
        expect(modifed_candidate.profile_cover).not_to be_nil
      end
    end
  end
end

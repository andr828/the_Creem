require 'rails_helper'

RSpec.describe Creem::Jpi::V1::CandidateController, type: :controller do

  describe 'PUT #update' do
    context 'with valid attributes' do
      login_candidate
      let(:candidate) { FactoryGirl.create(:entity_candidate ) }
      let(:test_image) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'logo.png'), 'image/png') }
      it 'updates the candidate profile' do
        put :update, id: candidate, candidate: FactoryGirl.attributes_for(:entity_candidate, first_name: 'Friduman', profile_image: test_image)

        modifed_candidate = Entity.where(first_name: 'Friduman').first
        expect(modifed_candidate).to be_present
        expect(modifed_candidate.profile_image).not_to be_nil
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Auth::RegistrationsController, type: :controller do

  describe "POST #create" do
    let(:user) { FactoryGirl.build(:user) }
    let(:type) { 'candidate' }
    let(:user_params) { {invalid: 'params'} }

    before { @request.env["devise.mapping"] = Devise.mappings[:user] }
    before { post :create, user: user_params, format: :json }

    it { expect(JSON.parse(response.body)).to eq("errors" => {"email"=>["can't be blank"], "password"=>["can't be blank"], "entity"=>["can't be blank"]}) }

    context "with invalid entity parameters" do
      let(:user_params) { { email: user.email, password: user.password, entity_attributes: {} } }

      it { expect(JSON.parse(response.body)).to eq("errors"=>{"entity.first_name"=>["can't be blank"], "entity.last_name"=>["can't be blank"], "entity.type"=>["can't be blank"]}) }
    end

    context "with valid parameters" do
      let(:user_params) do
        {
          email: user.email, password: user.password, invalid: 'blah',
          entity_attributes: { type: type, first_name: 'Victoria', last_name: 'Bitter', invalid: 'blah' }
        }
      end

      it "should create new User" do
        user = User.last
        expect(user).not_to be_nil
        expect(user).to have_attributes(email: user.email)
        expect(response).to have_http_status(:success)
      end

      context "creating a Candidate User" do
        it "should create new Candidate" do
          user = User.last
          expect(user.entity).not_to be_nil
          expect(user.entity).to have_attributes(first_name: 'Victoria', last_name: 'Bitter')
          expect(user.entity).to eq(Candidate.last)
          expect(response).to have_http_status(:success)
        end

        it "should have the correct response" do
          resp = JSON.parse(response.body)
          expect(resp).to include('id', 'email', 'created_at', 'updated_at')
          expect(resp['entity']).to include('id', 'type', 'first_name', 'last_name', 'metadata', 'created_at', 'updated_at')
        end

        it "should create new Account" do
          user = User.last
          expect(user.entity.account).to_not be_nil
        end
      end

      context "create a Employer User" do
        let(:type) { 'employer' }

        before { user_params[:entity_attributes].merge!(business_name: 'Die Kneipe') }
        before { post :create, user: user_params, format: :json }

        it "creates a employer user" do
          user = User.last
          expect(user.entity).not_to be_nil
          expect(user.entity).to have_attributes(business_name: 'Die Kneipe', first_name: 'Victoria', last_name: 'Bitter')
          expect(user.entity).to eq(Employer.last)
          expect(response).to have_http_status(:success)
        end

        it "should have the correct response" do
          resp = JSON.parse(response.body)
          expect(resp).to include('id', 'email', 'created_at', 'updated_at')
          expect(resp['entity']).to include('id', 'type', 'first_name', 'last_name', 'business_name', 'metadata', 'created_at', 'updated_at')
        end

        it "should create new Account" do
          user = User.last
          expect(user.entity.account).to_not be_nil
        end
      end

      context "with an invalid type" do
        let(:type) { 'invalid' }
        it "returns an unprocessable_entity" do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end

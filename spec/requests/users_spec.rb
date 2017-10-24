require 'spec_helper'

RSpec.describe "User API", type: :request do

  describe "GET /users" do
    let(:user) { FactoryGirl.create :user }
    before { get "/users/#{user.id}" }

    it 'returns the info about a reporter on a hash' do
      user_response = JSON.parse(response.body, sybmolize_names: true)
      expect(json['email']).to eql user.email
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

  describe 'POST /users' do
    context 'when user is successfully created' do
      let(:user) { FactoryGirl.attributes_for :user }
      before { post "/users", params: { password: '12345678', password_confirmation: '12345678', email: "user@domain.com" } }
      it "renders the json representation for the user record just created" do
        expect(json['email']).to eql "user@domain.com"
      end
    end
    context 'when is not created' do
      let(:invalid_user_attributes) { {password: '12345678',
                                      password_confirmation: '12345678'} }
      before { post "/users", params: { user: invalid_user_attributes } }
      it "renders an errors json" do
        expect(json).to have_key("errors")
      end

      it "renders the json errors on why the user could not be created" do
        user_response = JSON.parse(response.body, sybmolize_names: true)
        expect(json['errors']['email']).to include "can't be blank"
      end

      it "should have http status code 422" do
        expect(response).to have_http_status 422
      end
    end
  end
end

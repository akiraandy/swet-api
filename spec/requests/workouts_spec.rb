require 'rails_helper'

RSpec.describe "Workouts API", type: :request do

  let(:user) { create(:user_with_workouts) }
  let(:workout_id) { user.workouts.first.id }

  describe "GET /users/:id/workouts" do
    before { get "/users/#{user.id}/workouts" }

    it 'returns workouts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:user_id/workouts/:id' do
    before { get "/users/#{user.id}/workouts/#{workout_id}"}

    context 'when the record exists' do
      it 'returns the workout' do
        p json
        expect(json).not_to be_empty
        expect(json['workout_id']).to eq(workout_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:workout_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Workout/)
      end
    end
  end
end
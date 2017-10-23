require 'rails_helper'

RSpec.describe "User API", type: :request do

  describe 'GET /exercises' do
    before { get "/workouts/#{workout_id}/exercises" }

    it 'returns exercises' do
      expect(json).not_to be_empty
      expect(json.size).to eq(6)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /exercises/:id' do
    before { get "/exercises/#{exercise_id}"}

    context 'when the record exists' do
      it 'returns the exercise' do
        expect(json).not_to be_empty
        expect(json['name']).to eq(Exercise.first.name)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:exercise_id) { 200 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Exercise/)
      end
    end
  end

  describe 'POST /exercises' do
    let(:valid_attributes) { {name: "Push-ups" } }

    context 'when the request is valid' do
      before { post "/workouts/#{workout_id}/exercises", params: valid_attributes}

      it 'creates a workout' do
        expect(json['name']).to eq("Push-ups")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      context 'when the request is invalid' do
        before { post "/workouts/#{workout_id}/exercises", params: {name: nil} }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns a validation failture message' do
          expect(response.body).to match(/Validation failed: Name can't be blank/)
        end
      end
    end
  end

  describe "PUT /exercise/:id" do
    let(:valid_attributes) { { name: 'Edit name' } }

    context 'when the record exists' do
      before { put "/exercises/#{exercise_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
        expect(exercise.name).to eq('Edit name')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /exercises/:id" do
    before { delete "/exercises/#{exercise_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

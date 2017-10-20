# require 'rails_helper'
#
# RSpec.describe "Sets API", type: :request do
#
#   let(:user) { create(:user_with_workouts) }
#   let(:workout_id) { user.workouts.first.id }
#   let(:exercise_id) { user.exercises.first.id }
#   let(:set_id) { user.sets.first.id }
#
#   describe 'POST /sets' do
#     let(:valid_attributes) { {name: "Push-ups" } }
#
#     context 'when the request is valid' do
#       before { post "/users/#{user.id}/workouts/#{workout_id}/exercises", params: valid_attributes}
#
#       it 'creates a workout' do
#         expect(json['name']).to eq("Push-ups")
#       end
#
#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#
#       context 'when the request is invalid' do
#         before { post "/users/#{user.id}/workouts/#{workout_id}/exercises", params: {name: nil} }
#
#         it 'returns status code 422' do
#           expect(response).to have_http_status(422)
#         end
#
#         it 'returns a validation failture message' do
#           expect(response.body).to match(/Validation failed: Name can't be blank/)
#         end
#       end
#     end
#   end
#
#   describe "DELETE /sets/:id" do
#     before { delete "/users/#{user.id}/workouts/#{workout_id}/exercises/#{exercise_id}" }
#
#     it 'returns status code 204' do
#       expect(response).to have_http_status(204)
#     end
#   end
# end

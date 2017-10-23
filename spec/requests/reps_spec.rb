require 'rails_helper'

RSpec.describe "Reps API", type: :request do

  let(:user) { create(:user_with_workouts) }
  let(:set) { user.sets.first }
  let(:rep) { set.reps.first }

  describe 'POST /reps' do
    let(:valid_attributes) { { weight: 50 } }
    context 'when the request is valid' do
      before { post "/batches/#{set.id}/reps", params: valid_attributes}

      it 'creates a rep' do
        expect(set.reps.count).to eq(9)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /reps/:id' do
    let(:valid_attributes) { { weight: 100 } }

    context 'when the record exists' do
      before { put "/reps/#{rep.id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
        expect(set.reps.first.weight).to eq(100)
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /reps/:id" do
    before { delete "/reps/#{rep.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'destroys the rep' do
      expect(set.reps.count).to eq(7)
    end
  end
end

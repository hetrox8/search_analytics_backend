# spec/controllers/search_queries_controller_spec.rb
require 'rails_helper'

RSpec.describe SearchQueriesController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { { query: 'What is a good car' } }

      it 'creates a new SearchQuery' do
        expect {
          post :create, params: valid_attributes
        }.to change(SearchQuery, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { query: '  ' } }

      it 'does not create a new SearchQuery' do
        expect {
          post :create, params: invalid_attributes
        }.not_to change(SearchQuery, :count)
      end
    end
  end

  describe 'GET #index' do
    it 'returns a success response' do
      create(:search_query, query: 'What is a good car')
      get :index
      expect(response).to be_successful
    end

    it 'returns the correct analytics' do
      create(:search_query, query: 'What is a good car')
      get :index
      json = JSON.parse(response.body)
      expect(json).to eq('What is a good car' => 1)
    end
  end
end

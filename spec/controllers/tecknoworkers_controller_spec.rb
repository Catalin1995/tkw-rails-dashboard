require 'rails_helper'

RSpec.describe TecknoworkersController, type: :controller do
  render_views
  
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'get all' do
      get :index, format: :json
      expect(json['body'].size).to eq(1)
    end
  end

end

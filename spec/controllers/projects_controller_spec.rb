require 'rails_helper'
require 'pp'

RSpec.describe ProjectsController, type: :controller do
  render_views

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'get all' do
      create :project
      get :index, format: :json
      expect(json['body']['projects'].size).to eq(1)

      create :project
      create :project
      get :index
      expect(json['body']['projects'].size).to eq(3)
    end
  end
end

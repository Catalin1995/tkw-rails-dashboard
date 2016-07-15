require 'spec_helper'
require 'rails_helper'

describe 'API' do
  def check_route(a, b)
    a.should route_to(b)
  end

  it 'routes' do
    check_route({ get: '/api/news' }, controller: 'news', action: 'index', format: :json)

    check_route({ get: '/api/projects' }, controller: 'projects', action: 'index', format: :json)
    check_route({ get: '/api/projects/graph' }, controller: 'projects', action: 'graph', format: :json)

    check_route({ get: '/api/tecknoworkers' }, { controller: 'tecknoworkers', action: 'index', format: :json })
    check_route({ get: '/api/tecknoworkers/graph' }, controller: 'tecknoworkers', action: 'graph', format: :json)
  end
end

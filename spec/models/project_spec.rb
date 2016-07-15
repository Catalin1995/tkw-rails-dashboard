require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'setting status after creating issue' do
    project = create :project
    expect(project.status).to eq('on hold')
  end
end

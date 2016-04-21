require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  context 'when finding a project' do
    let!(:project) { FactoryGirl.create(:project) }

    it 'should redirect to project page when it exists' do
      get :show, id: project.id

      expect(response).to have_http_status 200
    end

    it 'should redirect to root when it not exists' do
      get :show, id: -1

      expect(response).to redirect_to root_path
    end
  end

end

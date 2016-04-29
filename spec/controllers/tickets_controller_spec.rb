require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  context 'when searching a ticket' do
    let!(:project) { FactoryGirl.create(:project) }
    let!(:ticket) { FactoryGirl.create(:ticket, project: project) }

    it 'should redirect to ticket page when it exists' do
      get :show, id: ticket.id, project_id: project.id

      expect(response).to have_http_status 200
    end

    it "should redirect to root when it doesn't exists" do
      get :show, id: -1, project_id: -1

      expect(response).to redirect_to root_path
    end
  end

end

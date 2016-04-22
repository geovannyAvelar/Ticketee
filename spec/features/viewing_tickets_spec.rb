require 'rails_helper'

RSpec.feature "Users can view tickets", type: :feature do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project) }

  before do
    visit project_path(project)
  end

  scenario do
    click_link ticket.title

    expect(page.current_url).to eq project_ticket_url(project, ticket)
  end

end

require 'rails_helper'

RSpec.feature "Users can edit tickets", type: :feature do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project) }

  before do
    visit project_ticket_path(project, ticket)
    click_link 'Edit'
  end

  scenario do
    fill_in 'Title', with: 'updated title'
    click_button 'Update Ticket'

    expect(page).to have_content 'Ticket has been updated'
    expect(page).to have_content 'updated title'
    expect(page).not_to have_content ticket.title
  end

end

require 'rails_helper'

RSpec.feature "Admins can see hide links", type: :feature do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project) }

  context 'admins' do
    before { login_as(admin) }

    scenario "can see the admin's area group" do

      visit '/'

      expect(page).to have_link "Admin's area"
    end

    scenario 'can see hide links on project page' do
      visit project_path(project)

      expect(page).to have_link 'Edit'
      expect(page).to have_link 'Delete'
    end

    scenario 'can see hide links on ticket page' do
      visit project_ticket_path(project, ticket)

      expect(page).to have_link 'Edit'
      expect(page).to have_link 'Delete'
    end

  end

  context 'anonymous users' do

    scenario "cannot see the admin's area link" do
      visit '/'

      expect(page).not_to have_link "Admin's area"
    end

    scenario "cannot see the links on project page" do
      visit project_path(project)

      expect(page).not_to have_link "Edit"
      expect(page).not_to have_link 'Delete'
    end
  end

end

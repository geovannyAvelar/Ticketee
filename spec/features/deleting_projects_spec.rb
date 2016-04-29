require 'rails_helper'

RSpec.feature "Admins can delete projects", type: :feature do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:admin) { FactoryGirl.create(:user, :admin) }

  before do
    login_as(admin)
    visit project_path project
  end

  scenario do
    click_link 'Delete'

    expect(page).to have_content 'Project has been deleted'
  end

end

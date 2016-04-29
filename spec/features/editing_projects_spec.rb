require 'rails_helper'

RSpec.feature "Users can edit projects", type: :feature do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:admin) { FactoryGirl.create(:user, :admin) }

  before do
    login_as(admin)
    
    visit project_path(project)
    click_link 'Edit'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'testing edit'
    click_button 'Update Project'

    expect(page.current_url).to eq project_url project
    expect(page).to have_content 'Project has been updated'
    expect(page).to have_content 'testing edit'
    expect(page).not_to have_content project.name
  end

end

require 'rails_helper'

RSpec.feature "Users can create projects", type: :feature do

  before do
    login_as(FactoryGirl.create(:user, :admin))

    visit admin_root_path
    click_link 'Create project'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'test project'
    fill_in 'Description', with: 'this is a test description'
    click_button 'Create Project'

    expect(page).to have_content 'Project has been created'
  end

  scenario 'with an invalid name' do
    fill_in 'Name', with: 'aa'
    fill_in 'Description', with: 'this is a test description'
    click_button 'Create Project'

    expect(page).to have_content 'Project has not been created'
    expect(page).to have_content 'Name is too short'
  end

  scenario 'with an invalid description' do
    fill_in 'Name', with: 'test project'
    fill_in 'Description', with: 'this'
    click_button 'Create Project'

    expect(page).to have_content 'Project has not been created'
    expect(page).to have_content 'Description is too short'
  end

  scenario 'with empty attributes' do
    click_button 'Create Project'

    expect(page).to have_content 'Project has not been created'
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

end

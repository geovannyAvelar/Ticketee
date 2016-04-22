require 'rails_helper'

RSpec.feature "Users can create tickets", type: :feature do
  let!(:project) { FactoryGirl.create(:project) }

  before do
    visit project_path(project)
    click_link 'Create ticket'
  end

  scenario 'with valid attributes' do
    fill_in 'Title', with: 'Houston'
    fill_in 'Description', with: 'We have a problem'
    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has been created'
  end

  scenario 'with a short title' do
    fill_in 'Title', with: 'aa'
    fill_in 'Description', with: 'We have a problem'
    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has not been created'
    expect(page).to have_content 'Title is too short'
  end

  scenario 'with a large title' do
    fill_in 'Title', with: 'a' * 31
    fill_in 'Description', with: 'We have a problem'
    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has not been created'
    expect(page).to have_content 'Title is too long'
  end

  scenario 'with a short description' do
    fill_in 'Title', with: 'Houston'
    fill_in 'Description', with: 'aaaa'
    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has not been created'
    expect(page).to have_content 'Description is too short'
  end

  scenario 'with a large description' do
    fill_in 'Title', with: 'Houston'
    fill_in 'Description', with: 'a' * 51
    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has not been created'
    expect(page).to have_content 'Description is too long'
  end

  scenario 'with empty attributes' do
    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has not been created'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

end

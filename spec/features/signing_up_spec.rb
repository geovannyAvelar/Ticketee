require 'rails_helper'

RSpec.feature "Users can signup", type: :feature do

  before do
    visit '/'
    click_link 'Sign up'
  end

  scenario 'with valid attributes' do
    fill_in "Email", with: 'test1@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'You have signed up successfully'
  end

  scenario 'with incorrect password confirmation' do
    fill_in 'Email', with: 'test2@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'other_password'
    click_button 'Sign up'

    expect(page).to have_content "Password confirmation doesn't match"
  end
end

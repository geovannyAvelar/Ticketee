require 'rails_helper'

RSpec.feature "Users can sign in", type: :feature do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit '/'
    click_link 'Sign in'
  end

  scenario do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully'
  end

end

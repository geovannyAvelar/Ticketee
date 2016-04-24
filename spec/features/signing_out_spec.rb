require 'rails_helper'

RSpec.feature "Users can sign out", type: :feature do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
    visit '/'
  end

  scenario do
    click_link 'Sign out'

    expect(page).to have_content 'Signed out successfully'
  end

end

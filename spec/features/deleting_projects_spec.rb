require 'rails_helper'

RSpec.feature "Users can delete projects", type: :feature do
  let!(:project) { FactoryGirl.create(:project) }

  before do
    visit project_path project
  end

  scenario do
    click_link 'Delete'

    expect(page).to have_content 'Project has been deleted'
  end

end

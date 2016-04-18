require 'rails_helper'

RSpec.feature "Users can view projects", type: :feature do
  let!(:project) { FactoryGirl.create(:project) }

  scenario do
    visit project_path(project)

    expect(page.current_url).to eq project_url(project)
  end

end

require "rails_helper"

RSpec.feature "User can delete the project" do
  scenario "can destroy" do
    project = FactoryGirl.create(:project, name: "Testing")
    visit "/"
    expect(page).to have_content "Testing"
    click_link "Delete Project"
    expect(page).not_to have_content "Testing"
  end
end
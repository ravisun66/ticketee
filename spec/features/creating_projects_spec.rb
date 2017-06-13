require 'rails_helper'

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit "/"
    click_link "New Project"
    name = "My Homework"
    description = "My home task module"
    fill_in "Name", with: name
    fill_in "Description", with: description
    click_button "Create Project"
    expect(page).to have_content "Project has been created."
    project = Project.find_by(name: name)
    expect(page.current_url).to eq project_url project
    title = "#{name} | Ticketee"
    expect(page).to have_title title 
  end
end
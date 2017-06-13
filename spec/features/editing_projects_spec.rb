require "rails_helper"

RSpec.feature "User can edit existings projects" do 
  before do 
    name = "Another tasks"
    @project = FactoryGirl.create(:project, name: name)

    visit "/"
    click_link "Edit Project"
  end
  scenario "with valid attributes" do 
    new_name = "Another tasks update"

    fill_in ("Name"), with: new_name
    click_button "Update Project"
    expect(page.current_path).to eq project_path @project
    expect(page).to have_content "Project has been updated."
    expect(page).to have_content new_name
  end
  scenario "with invalid attributes" do
    new_name = ""

    fill_in ("Name"), with: new_name
    click_button "Update Project"
    expect(page).to have_content "Project has not been updated."
    expect(page).to have_content "Name can't be blank"
  end
end
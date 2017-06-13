require 'rails_helper'

RSpec.feature "User can view project" do 
  scenario "with the project details" do
    name = "My Home work"
    project = FactoryGirl.create(:project, name: name)
    visit "/"
    click_link name
    expect(page.current_url).to eq project_url project
  end
end
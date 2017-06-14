require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it "handels the missing project correctly" do
    get :show, id: "undefined"

    expect(response).to redirect_to projects_path
    message = "The project you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end
end

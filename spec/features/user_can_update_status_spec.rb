require 'rails_helper'

feature 'User can update their status for other people to see' do
  scenario 'Auth user creates status' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit user_profile_path(user)

    expect(page).to have_content("Sleeping")

    fill_in "Status", with: "Working on Rails"
    click_on "Update status"

    expect(page).to_not have_content("Sleeping")
    expect(page).to have_content("Working on Rails")

  end
end


require 'rails_helper'

feature 'user can update account' do
  scenario 'provides valid updates', focus: true do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit user_profile_path(user)
    click_on "Update Account"

    fill_in "First name", with: "Spencer"
    fill_in "Last name", with: "Dixon"
    fill_in "Current password", with: user.password

    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end
end

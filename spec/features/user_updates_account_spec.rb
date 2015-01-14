require 'rails_helper'

feature 'user can update account' do
  scenario 'provides valid updates' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit edit_user_registration_path

    fill_in "First name", with: "Spencer"
    fill_in "Last name", with: "Dixon"
    fill_in "Current password", with: user.password

    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end
end

require 'rails_helper'

feature 'user can update account' do
  scenario 'provides valid updates' do
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

  scenario 'different users cant update profiles', focus: true do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    sign_in_as(user1)

    visit user_profile_path(user2)
    expect(page).to_not have_content("Update Account")
  end
end

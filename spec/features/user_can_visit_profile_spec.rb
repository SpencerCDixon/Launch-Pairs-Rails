require 'rails_helper'

feature 'User can visit their profile' do
  scenario 'auth user sees welcome message' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit user_profile_path(user)

    expect(page).to have_content("Welcome, #{user.first_name}")
  end

  scenario 'unauth user sees the users name' do
    user = FactoryGirl.create(:user)
  end
end

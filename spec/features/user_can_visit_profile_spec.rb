require 'rails_helper'

feature 'User can visit their profile' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'auth user sees welcome message' do
    sign_in_as(user)
    visit user_profile_path(user)

    expect(page).to have_content("#{user.first_name}'s Profile")
  end

  scenario 'unauth user gets asked to log in' do
    visit user_profile_path(user)

    expect(page).to have_content("Log in")
  end
end

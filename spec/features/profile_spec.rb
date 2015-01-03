require 'rails_helper'

feature "profile" do
  let(:user) { FactoryGirl.create(:user) }

  context "authorized user" do

    scenario "displays welcome message" do
      sign_in_as(user)
      visit user_profile_path(user)
      expect(page).to have_content("#{user.first_name}'s Profile")
    end

  end

  context "visitor" do

    scenario 'unauth user gets asked to log in' do
      visit user_profile_path(user)
      expect(page).to have_content("Log in")
    end

  end
end

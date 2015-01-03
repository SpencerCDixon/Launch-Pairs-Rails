require 'rails_helper'

feature "profile" do
  let(:user) { FactoryGirl.create(:user) }

  context "authorized user" do

    before(:each) do
      sign_in_as(user)
    end

    scenario "displays welcome message" do
      visit user_profile_path(user)
      expect(page).to have_content("#{user.first_name}'s Profile")
    end

    scenario "create profile info", focus: true do
      visit user_profile_path(user)

      click_on "Enhance profile"

      fill_in "Blog url", with: "http://www.cranberrycoder.com"
      fill_in "Facebook", with: "http://www.facebook.com/spencercdixon"
      fill_in "Twitter", with: "http://www.twitter.com/spencercdixon"
      fill_in "Github", with: "http://www.github.com/spencercdixon"
      fill_in "Linked in", with: "http://www.linkedin.com/spencercdixon"
      fill_in "Phone number", with: "6178945641"
      fill_in "Email", with: "spencercdixon@gmail.com"

      click_on "Create profile"

      expect(page).to have_content("Profile information updated.")
      expect(page).to have_content("spencercdixon@gmail.com")
    end

    scenario "profile has already been created" do

    end

    scenario "user cannot update other users information" do

    end

  end

  context "visitor" do

    scenario 'unauth user gets asked to log in' do
      visit user_profile_path(user)
      expect(page).to have_content("Log in")
    end

  end
end

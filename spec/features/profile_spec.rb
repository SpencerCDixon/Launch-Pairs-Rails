require 'rails_helper'

feature "profile" do
  let(:user) { FactoryGirl.create(:user) }

  context "authorized user" do

    scenario "displays welcome message" do
      sign_in_as(user)
      visit user_profile_path(user)
      expect(page).to have_content("#{user.first_name}'s Profile")
    end

    scenario "create profile info" do
      sign_in_as(user)
      visit user_profile_path(user)

      click_on "Add Personal Info"

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
      expect(page).to have_content("6178945641")
      expect(page).to have_content("Facebook")
      expect(page).to have_content("Twitter")
      expect(page).to have_content("Github")
      expect(page).to have_content("Linked In")
      # More expectations need to go here
    end

    scenario "profile has already been created" do
      profile = FactoryGirl.create(:profile)
      sign_in_as(profile.user)

      visit user_profile_path(profile.user)
      expect(page).to have_content("Update Personal Info")
      expect(page).to_not have_content("Add Personal Info")
    end

    scenario "update with new information" do
      profile = FactoryGirl.create(:profile)

      sign_in_as(profile.user)

      visit user_profile_path(profile.user)
      click_on "Update Personal Info"

      fill_in "Email", with: "new_email@gmail.com"
      click_on "Update profile"

      expect(page).to have_content("Profile successfully updated")
      expect(page).to have_content("new_email@gmail.com")
    end

    scenario "user cannot update other users information" do
      profile = FactoryGirl.create(:profile)
      sign_in_as(user)

      visit user_profile_path(profile.user)

      expect(page).to_not have_content("Update Personal Info")
      expect(page).to_not have_content("Add Personal Info")
    end

    # test needs to be restructured
    # scenario "displays % of people paired with" do
    #   user1 = FactoryGirl.create(:user)
    #   user2 = FactoryGirl.create(:user)
    #   profile = FactoryGirl.create(:profile)
    #   sign_in_as(profile.user)
    #
    #   visit dashboard_path
    #   find(:css, "##{user1.id}").click
    #
    #   visit user_profile_path(profile.user)
    #   expect(page).to have_content("Percent Paired With: 50.0 %")
    # end
  end

  context "visitor" do

    scenario 'unauth user gets asked to log in' do
      visit user_profile_path(user)
      expect(page).to have_content("Log in")
    end

  end
end

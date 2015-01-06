require 'rails_helper'

feature 'dashboard' do
  context 'authorized user' do
    scenario 'can see other users successfully' do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      sign_in_as(user2)
      visit root_path

      expect(page).to have_content(user1.email)
      expect(page).to have_content(user2.email)
    end

    scenario 'can filter for looking to pair' do
      user = FactoryGirl.create(:user)
      pair1 = FactoryGirl.create(:status_pair)
      pair2 = FactoryGirl.create(:status_pair)
      zone = FactoryGirl.create(:status_zone)

      sign_in_as(user)
      visit dashboard_path

      click_on 'Ready To Pair'
      expect(page).to have_content(pair1.user.email)
      expect(page).to have_content(pair2.user.email)
      expect(page).to_not have_content(zone.user.email)
    end

    scenario 'can filter for open to help' do
      user = FactoryGirl.create(:user)
      help1 = FactoryGirl.create(:status_help)
      help2 = FactoryGirl.create(:status_help)
      zone = FactoryGirl.create(:status_zone)

      sign_in_as(user)
      visit dashboard_path

      click_on 'Open To Help'
      expect(page).to have_content(help1.user.email)
      expect(page).to have_content(help2.user.email)
      expect(page).to_not have_content(zone.user.email)
    end

    scenario 'can filter for feeling lucky' do
      user1 = FactoryGirl.create(:user)
      pair1 = FactoryGirl.create(:user)
      pair2 = FactoryGirl.create(:user)
      lucky_user = FactoryGirl.create(:status_pair)
      unlucky_user = FactoryGirl.create(:status_help)

      user1.pairings.create(user_id: user1.id, pair_id: pair1.id)
      user1.pairings.create(user_id: user1.id, pair_id: pair2.id)

      sign_in_as(user1)
      visit dashboard_path
      click_on "I'm Feeling Lucky"

      expect(page).to have_content(lucky_user.user.email)
      expect(page).to_not have_content(unlucky_user.user.email)
    end

    scenario 'feed displays 5 recent events' do
      FactoryGirl.create_list(:status_pair, 10)
      user = FactoryGirl.create(:user)
      FactoryGirl.create_list(:status_zone, 2, user: user)
      FactoryGirl.create_list(:status_help, 2, user: user)

      sign_in_as(user)
      visit user_profile_path(user)

      fill_in "project_project", with: "Book reviews in space"
      click_on 'Update project'

      visit dashboard_path
      expect(page).to have_content("#{user.first_name} just updated status to: In The Zone")
      expect(page).to have_content("#{user.first_name} just updated status to: In The Zone")
      expect(page).to have_content("#{user.first_name} just updated status to: Open To Help")
      expect(page).to have_content("#{user.first_name} just updated status to: Open To Help")
      expect(page).to have_content("#{user.first_name} just updated project to: Book reviews in space")
    end
  end

  context 'visitor' do
    scenario 'unauthorized user gets redirected to sign in page' do
      visit root_path
      expect(page).to have_content("Log in")
    end
  end
end

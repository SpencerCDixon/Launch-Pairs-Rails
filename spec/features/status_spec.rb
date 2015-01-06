require 'rails_helper'

feature "status" do

  context "authorized user" do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in_as(user)
    end

    scenario "creates status successfully" do
      visit user_profile_path(user)

      update_status("In The Zone")

      expect(page).to_not have_content("Sleeping")
      expect(page).to have_content("In The Zone")
    end

    scenario "status gets updated on dashboard" do
      visit user_profile_path(user)

      update_status("In The Zone")

      visit dashboard_path
      expect(page).to have_content("In The Zone")
    end

  end
end


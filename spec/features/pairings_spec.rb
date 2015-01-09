require 'rails_helper'

feature "pairings" do

  context "authorized user" do
    let(:user) { FactoryGirl.create(:user) }

    # scenario "clicks pair in dashboard" do
    #   partner = FactoryGirl.create(:user)
    #   sign_in_as(user)
    #
    #   visit dashboard_path
    #   expect(page).to have_content('Paired?')
    #
    #   find(:css, "##{partner.id}").click
    #
    #   expect(page).to have_content('Complete')
    #   expect(page).to_not have_content('Paired?')
    # end

  end

  context "visitor" do

    scenario "gets redirected from dashboard" do
      visit dashboard_path
      expect(page).to have_content("Log in")
    end

  end

  # scenario 'unsuccessful pairing redirects to dashboard' do
  #   user = FactoryGirl.create(:user)
  #   partner = FactoryGirl.create(:user)
  #   sign_in_as(user)
  #
  #   visit dashboard_path
  #   find(:css, "##{partner.id}").click
  #
  #   visit pairings_path
  #   expect(page).to have_content('Already paired with that person!')
  # end
end

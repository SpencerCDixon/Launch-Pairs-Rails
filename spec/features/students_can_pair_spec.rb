require 'rails_helper'

feature 'Student can keep track of who they have paired with' do

  scenario 'student clicks pair in dashboard' do
    user1 = FactoryGirl.create(:user)
    partner = FactoryGirl.create(:user)
    sign_in_as user1

    visit dashboard_path

    find(:css, "##{partner.id}").click

    expect(page).to have_content('Complete')
  end

  scenario 'unauth user gets redirected from dashboard' do
    visit dashboard_path
    expect(page).to have_content("Log in")
  end
end

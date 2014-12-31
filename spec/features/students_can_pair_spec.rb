require 'rails_helper'

feature 'Student can keep track of who they have paired with' do
  scenario 'student clicks pair in dashboard', focus: true do
    user1 = FactoryGirl.create(:user)
    partner = FactoryGirl.create(:user)
    sign_in_as user1

    visit dashboard_path

    find(:css, "##{partner.id}").click

    expect(page).to have_content('Complete')
    expect(user1.pairs).to include(partner)
  end
end

require 'rails_helper'

feature 'Auth user can update their current project' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)
    visit user_profile_path(user)

    fill_in 'Current project', with: 'Book reviews in space'
    click_on 'Update project'

    expect(page).to have_content('Book reviews in space')
  end
end

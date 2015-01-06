require 'rails_helper'

feature 'projects' do

  context 'authorized user' do

    scenario 'successfully updates project' do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:project, user: user)
      FactoryGirl.create(:status, user: user)
      sign_in_as(user)

      visit user_profile_path(user)
      expect(page).to have_content("In deep thought")

      fill_in "project_project", with: "Book reviews in space"
      click_on 'Update project'

      expect(page).to have_content('Project updated')
      expect(page).to have_content('Book reviews in space')
    end

  end
end

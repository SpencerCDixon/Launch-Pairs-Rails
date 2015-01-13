require 'rails_helper'

feature 'projects' do

  context 'authorized user' do
    let(:user) { FactoryGirl.create(:complete_user) }

    scenario 'successfully updates project' do
      sign_in_as(user)

      visit user_profile_path(user)
      expect(page).to have_content("In deep thought")

      fill_in "project_project", with: "Book reviews in space"
      click_on 'Update project'

      expect(page).to have_content('Project updated')
      expect(page).to have_content('Book reviews in space')
    end

    scenario 'unsuccessful update', focus: true do
      sign_in_as(user)

      visit user_profile_path(user)
      click_on "Update project"

      expect(page).to have_content("Project can't be blank!")

    end

  end
end

require 'rails_helper'

feature 'Home page' do 
  context 'authorized user' do
    scenario 'can see other users successfully' do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      sign_in_as(user2)
      visit root_path

      expect(page).to have_content(user1.email)
      expect(page).to have_content(user2.email)
    end
  end

  context 'visitor' do
    scenario 'unauthorized user gets redirected to sign in page' do
      visit root_path
      expect(page).to have_content("Log in")
    end
  end
end

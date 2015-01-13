require 'rails_helper'

feature "flowdock api" do
  context "authorized user" do

    scenario 'can successfully post questions on flowdock', :vcr do
        user = FactoryGirl.create(:user)
        sign_in_as(user)

        visit dashboard_path
        fill_in "flow_question", with: "VCR is a cool gem"
        click_on "Ask Your Question"

        expect(page.status_code).to eq(200)
    end

  end
end

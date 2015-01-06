require 'rails_helper'

describe StudentRegistration do
  context 'when registering' do

    it 'if the save is successful it creates empty project' do
      user = FactoryGirl.create(:user)
      registration = StudentRegistration.new(user)
      registration.create_dependencies

      expect(user.statuses.count).to eq(1)
      expect(user.projects.count).to eq(1)
    end
    it 'if the save is successful it creates an empty status'

  end
end

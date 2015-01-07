require 'rails_helper'

describe StudentRegistration do
  context 'when registering' do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      registration = StudentRegistration.new(user)
      registration.create_dependencies
    end

    it 'if the save is successful it creates empty project' do
      expect(user.projects.count).to eq(1)
    end

    it 'if the save is successful it creates an empty status' do
      expect(user.statuses.count).to eq(1)
    end
  end
end

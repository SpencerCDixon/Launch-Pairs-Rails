require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_valid(:email).when('user@example.com', 'apple@gmail.com') }
  it { should_not have_valid(:email).when('', nil, 'slfjsdlkf') }

  context '#paired_with?' do
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    it 'matches with partner 2' do
      user1.pairings.new(user_id: user1.id, pair_id: user2.id).save
      expect(user1.paired_with?(user2)).to be_truthy
    end

    it 'doesnt pass without a pairing' do
      expect(user1.paired_with?(user2)).to be_falsy
    end
  end

  context '#current_project' do
    let(:project) { FactoryGirl.create(:project) }
    let(:user) { FactoryGirl.create(:user) }

    it 'returns default project if none exists' do
      expect(user.current_project).to eq('In deep thought')
    end

    it 'returns latest project if one exists' do
      expect(project.user.current_project).to eq('Finishing up Launch Pairs')
    end
  end

  # context "#percent_paired_with" do
  #   it 'returns 50% when there are two people', focus: true do
  #     user1 = FactoryGirl.create(:user)
  #     user2 = FactoryGirl.create(:user)
  #     main_user = FactoryGirl.create(:user)
  #     main_user.pairings.create(user1)
  #     binding.pry
  #   end
  # end
end

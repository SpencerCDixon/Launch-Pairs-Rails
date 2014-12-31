require 'rails_helper'

RSpec.describe Pairing, :type => :model do
  it { should have_valid(:user_id).when('1', '100') }
  it { should_not have_valid(:user_id).when('', nil, 'sadflkjsdlfk') }

  it { should have_valid(:pair_id).when('1', '100') }
  it { should_not have_valid(:pair_id).when('', nil, 'sadflkjsdlfk') }
end

require 'rails_helper'

RSpec.describe Status, :type => :model do
  it { should have_valid(:description).when('In The Zone', 'Ready To Pair', 'Open To Help', 'Sleeping') }
  # it { should_not have_valid(:description).when('', nil, 'sadflkjsdlfk') }
end

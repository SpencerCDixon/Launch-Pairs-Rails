require 'rails_helper'

RSpec.describe Profile, :type => :model do
  it { should have_valid(:user_id).when('1', '100') }
  it { should_not have_valid(:user_id).when(nil, '', 'asdf', 'dog') }

  it { should have_valid(:blog_url).when('http://www.google.com', 'https://wwww.google.com') }
  it { should_not have_valid(:blog_url).when(nil, '', 'asdf', 'dog', 'www.google.com') }

  it { should have_valid(:facebook).when('http://www.google.com', 'https://wwww.google.com') }
  it { should_not have_valid(:facebook).when(nil, '', 'asdf', 'dog', 'www.google.com') }

  it { should have_valid(:twitter).when('http://www.google.com', 'https://wwww.google.com') }
  it { should_not have_valid(:twitter).when(nil, '', 'asdf', 'dog', 'www.google.com') }

  it { should have_valid(:github).when('http://www.google.com', 'https://wwww.google.com') }
  it { should_not have_valid(:github).when(nil, '', 'asdf', 'dog', 'www.google.com') }

  it { should have_valid(:linked_in).when('http://www.google.com', 'https://wwww.google.com') }
  it { should_not have_valid(:linked_in).when(nil, '', 'asdf', 'dog', 'www.google.com') }

  it { should have_valid(:email).when('example@example.com', 'user@user.org') }
  it { should_not have_valid(:email).when(nil, '', 'asdf', 'dog', 'www.google.com') }
end

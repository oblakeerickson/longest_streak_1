require 'spec_helper'

describe User do
  
  before { @user = User.new(github_id: 1, username: "oblakeerickson", email: "o.blakeerickson@gmail.com", longest_streak: 12) }

  subject { @user }

  it { should respond_to(:github_id) }
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:longest_streak) }

  it { should be_valid }

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do 
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
end

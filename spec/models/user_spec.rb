require 'rails_helper'

RSpec.describe User, type: :model do

  describe "User Validations" do
    it "is valid with a valid name, email, password, and password confirmation" do
      @user = User.new(name: "test", last_name: "ing", email: "123@gmail.com", password: "abc", password_confirmation: "abc")
      expect(@user).to be_valid
    end
    it "is invalid when the password and password confirmation do not match" do
      @user = User.new(name: "test", last_name: "ing", email: "123@gmail.com", password: "abc", password_confirmation: "def")
      expect(@user).to_not be_valid
    end
    it "is invalid with password is less than 3 characters" do
      @user = User.new(name: "test", last_name: "ing", email: "123@gmail.com", password: "ab", password_confirmation: "ab")
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "is valid when the user logs in with valid email and password" do
      @user = User.create(name: "test", last_name: "ing", email: "123@gmail.com", password: "abc", password_confirmation: "abc")
      user_auth = User.authenticate_with_credentials("123@gmail.com", "abc")
      expect(@user).to eq(user_auth)
    end
    it "is invalid when the user logs in with an invalid email" do
      @user = User.create(name: "test", last_name: "ing", email: "123@gmail.com", password: "abc", password_confirmation: "abc")
      user_auth = User.authenticate_with_credentials("321@gmail.com", "abc")
      expect(@user).to_not eq(user_auth)
    end
    it "is valid when the user logs in with some upper-case letters and an extra space at the end of the email" do
      @user = User.create(name: "test", last_name: "ing", email: "123@gmail.com", password: "abc", password_confirmation: "abc")
      user_auth = User.authenticate_with_credentials("123@gMAil.com ", "abc")
      expect(@user).to eq(user_auth)
    end
  end

end

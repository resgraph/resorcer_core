require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  describe ".create" do
    before do
      @valid_attributes = {
              :login => "valid_user",
              :email => "valid_user@test.com"
      }
    end

    it "should create a user when given valid attributes" do
      user = User.new(@valid_attributes)
      user.should be_valid
    end

    it "should not create a user when given invalid attributes" do
      attrs = @valid_attributes.delete(:login)
      user = User.new(attrs)
      user.should_not be_valid
    end

  end
end
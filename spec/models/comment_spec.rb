require File.dirname(__FILE__) + '/../spec_helper'

describe Comment do

  describe ".create" do
    before do
      @valid_attributes = {
              :title => "valid comment",
              :body => "This is a valid comment."
      }
    end

    it "should create a comment when given valid attributes" do
      comment = Comment.new(@valid_attributes)
      comment.should be_valid
    end

    it "should not create a comment when given invalid attributes" do
      attrs = @valid_attributes.delete(:body)
      comment = Comment.new(attrs)
      comment.should_not be_valid
    end

  end
end
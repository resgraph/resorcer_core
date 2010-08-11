require File.dirname(__FILE__) + '/../spec_helper'

describe Post do

  describe ".create" do
    before do
      @valid_attributes = {
              :title => "valid post",
              :body => "This is a valid post."
      }
    end

    it "should create a post when given valid attributes" do
      post = Post.new(@valid_attributes)
      post.should be_valid
    end

    it "should not create a post when given invalid attributes" do
      attrs = @valid_attributes.delete(:title)
      invalid_post = Post.new(attrs)
      invalid_post.should_not be_valid
    end

  end
end
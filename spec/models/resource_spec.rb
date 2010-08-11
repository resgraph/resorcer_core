require File.dirname(__FILE__) + '/../spec_helper'

describe Resource do
  before do
    @resource = Resource.new(:url => "http://www.resorcer.com/",
                             :title => "A Resorcer webpage",
                             :description => "This is a resorcer web page that contains a description of the Resorcer web system",
                             :content_type => "text/html",
                             :notes => "A note",
                             :language => "english"
                            )
  end

  describe ".new" do
    before do
      @valid_attributes = {
              :title => 'title',
              :description => 'description',
              :url => 'http://www.url.com',
              :author => 'An Author',
              :language => 'english',
              :content_type => "text/html",
              :notes => 'notes'
      }
    end
    it "should create a resource given valid attributes" do
      resource = Resource.create(@valid_attributes)
      resource.should be_valid
    end

    it "should not be valid without a url attribute" do
      attrs = @valid_attributes.delete(:url)
      resource = Resource.create(attrs)
      resource.should_not be_valid
      resource.should have(2).errors_on(:url)
    end

    it "should not be valid with a badly formed url attribute" do
      invalid_resource = Factory.build(:invalid_url_resource)
      invalid_resource.should_not be_valid
      invalid_resource.should have(1).errors_on(:url)
    end
  end
end
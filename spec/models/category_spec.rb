require File.dirname(__FILE__) + '/../spec_helper'

describe Category do

  describe ".new" do

    before do
      Category.delete_all
      @valid_attributes = {
              :name => "valid category",
              :description => "This is a valid category.",
              :parent_id => 0,
              :lft => 0,
              :rgt => 0
      }
    end

    it "should create a category when given valid attributes" do
      category = Category.new(@valid_attributes)
      category.should be_valid
    end

    it "should have errors creating a category when given invalid attributes" do
      attrs = @valid_attributes.delete(:name)
      category = Category.new(attrs)
      category.should_not be_valid
      category.should have(1).errors_on(:name)
    end

    it "should allow the creation of a category with a name that already exists at a different level" do
      @science = Factory.create(:science)
      @second_science = Category.new(:name => 'Science', :parent_id => @science.id)
      @second_science.should be_valid
    end

    it "should not allow the creation of a category with a name that already exists at the same level" do
      @science = Factory.create(:science)
      @second_science = Category.new(:name => 'Science')
      @second_science.should_not be_valid
      @second_science.should have(1).errors_on(:name)
    end
  end

  describe "nested set" do

    before do
      Category.delete_all
      @science = Factory.create(:science)
      @physics = Factory.create(:physics)
      @physics.move_to_child_of(@science)
      @biology = Factory.create(:biology)
      @biology.move_to_child_of(@science)
      @science.reload
    end

    it "should have a root node with the name 'Science'" do
      Category.root.name.downcase.should == 'science'
    end

    it "should be at level 0 and have two children" do
      @science.level.should == 0
      @science.children.size.should == 2
    end

    it "should have a child with the name 'Biology'" do
      children = @science.children
      has_biology = false
      children.each do |c|
        if c.name.downcase == 'biology'
          has_biology = true
        end
      end
      has_biology.should == true
    end

    it "should put two children into physics" do
      gravity = Category.create!(:name => "Gravity", :description => "The physics of gravity.", :parent_id => @physics.id)
      thermodynamics = Category.create!(:name => "Thermodynamics", :description => "The physics of thermodynamics.", :parent_id => @physics.id)
      @physics.level.should == 1
      @physics.children.size.should == 2
      gravity.self_and_siblings.size.should == 2
      Category.root.descendants.size.should == 4
      Category.root.leaves.size.should == 3
    end
  end

  describe "import category nested set" do
    before do
      @file_path = File.dirname(__FILE__) + "/../data/test_nested_set.set"
    end

    it "should return false if the file does not exist" do
      Category.import_set("bad_file.set").should == false
    end

    it "should return true if the file has been upload and all categories created" do
      Category.import_set(@file_path)
    end
  end
end

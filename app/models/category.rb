class Category < ActiveRecord::Base
  acts_as_nested_set

  validates_presence_of :name, :message => "must have a value."
  validates_uniqueness_of :name, :scope => :parent_id, :message => "must be unique with this parent."

  #
  # import a nested set from a text file and create all the Category entries
  #
  def self.import_set(file_path, options={})
    unless (File.exist?(file_path))
      return false
    end

    true
  end
end

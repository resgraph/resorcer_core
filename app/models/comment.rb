class Comment < ActiveRecord::Base
  # behaviours
  acts_as_nested_set

  # relationships
  belongs_to :commentable, :polymorphic => true

  # validations
  validates_presence_of :body, :title
  validates_length_of :title, :minimum => 3, :too_short => "^The comment title needs to be at least 3 characters."

  # with_scope finders
  scope :recent_comments, lambda { |from, till| { :conditions => { :created_at => from .. till }, :order => "created_at DESC" } }

  # return all top-level comments
  scope :threads, :conditions => [ 'parent_id is ?', nil ]


end

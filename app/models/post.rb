class Post < ActiveRecord::Base
  # relationships
  belongs_to  :postable, :polymorphic => true
  has_many :comments, :as => :commentable

  # validations
  validates_presence_of :title, :body
  validates_associated :comments

  # add tagging system
  acts_as_taggable

  # with_scope finders
  scope :timed_posts, lambda { |from, till| { :conditions => { :created_at => from .. till } , :order => "created_at DESC" } }

end

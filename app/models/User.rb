class User < ActiveRecord::Base

  validates_presence_of :login, :email
  validates_length_of :login, :minimum => 2, :message => "must be greater than 2 characters"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  # devise support
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :password, :password_confirmation, :remember_me,
                  :login, :email, :first_name, :last_name, :website,
                  :facebook_account, :twitter_account

  # users are taggers
  acts_as_tagger

  # users can have associated tags
  acts_as_taggable_on :tags

  # act as a rater
  ajaxful_rater

end

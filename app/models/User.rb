class User < ActiveRecord::Base

  validates_presence_of :login, :email
  validates_length_of :login, :minimum => 2, :message => "must be greater than 2 characters"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
end

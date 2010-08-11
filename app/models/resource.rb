class Resource < ActiveRecord::Base

  # validations
  validates_presence_of :url, :message => 'must have a url to be valid.'
  validates_format_of :url, :with => URI::regexp(%w(http https)), :message => "must conform to the Ruby URI#regexp for matching accepted protocols."

  # resources can be straight-forwarded added, or they can go through a process of being submitted, reviewed and approved

  # resources can be rated both numerically and verbally

end

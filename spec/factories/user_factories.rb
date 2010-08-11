Factory.define :valid_user, :class => User do |u|
  u.login 'valid_user'
  u.email 'valid_user@test.com'
  u.first_name 'Valid'
  u.last_name 'User'
  u.website 'http://www.valid_user.com'
  u.facebook_account 'valid_facebook'
  u.twitter_account 'valid_twitter'
end

Factory.define :invalid_user, :class => User do |u|
  u.first_name 'Invalid'
  u.last_name 'User'
end

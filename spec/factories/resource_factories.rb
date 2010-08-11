
Factory.define :valid_resource, :class => Resource do |r|
  r.title 'A valid Resource'
  r.description 'This is the description of a valid Resource.'
  r.url 'http://www.resource.com/valid_resource.html'
  r.author 'Arthur Person'
  r.language 'english'
  r.content_type 'text/html'
  r.notes 'valid resource factory object'
end

Factory.define :invalid_url_resource, :class => Resource do |r|
  r.url 'lttp://www.resource.com/invalid_resource.html'
end

Factory.define :science, :class => Category do |c|
  c.name "Science"
  c.description "A top level category to hold all sub-categories of Science."
end

Factory.define :physics, :class => Category do |c|
  c.name 'Physics'
  c.description 'A sub-category of Science.'
end

Factory.define :biology, :class => Category do |c|
  c.name 'Biology'
  c.description 'A sub-category of Science.'
end
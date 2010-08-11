# encoding: UTF-8
require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'

require 'rspec/core'
require 'rspec/core/rake_task'

Rspec::Core::RakeTask.new(:spec)

task :default => :spec

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ResorcerCore'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

spec = Gem::Specification.new do |s|
  s.name = "resorcer-core"
  s.summary = "Resorcer system gem."
  s.description = "Resorcer is a system for creating web properties that aggregate web resources and present them for searching and access."
  s.email = "forever@thelongterm.net"
  s.homepage = "http://www.resorcer.com"
  s.authors = ["Robert Schmitt"]
  s.files =  FileList["[A-Z]*", "lib/**/*", "app/**/*"]
  s.add_dependency("awesome_nested_set", ">= 1.4.3")
  s.version = "0.0.1"
end

Rake::GemPackageTask.new(spec) do |pkg|
end

desc "Install the gem #{spec.name}-#{spec.version}.gem"
task :install do
  system("gem install pkg/#{spec.name}-#{spec.version}.gem --no-ri --no-rdoc")
end
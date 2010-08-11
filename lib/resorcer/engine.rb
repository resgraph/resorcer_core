require 'rails'

module Resorcer

  class Engine < Rails::Engine
    rake_tasks do
      load "railties/tasks.rake"
    end
  end

end

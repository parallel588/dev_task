require "dev_task/version"
require "dev_task/css2scss"
require "dev_task/core_ext/string"

module DevTask
  if defined?(Rails) && defined?(Rails::Engine)
    class Engine < ::Rails::Engine
      require 'dev_task/engine'
    end

    module Rails
      class Railtie < ::Rails::Railtie
        rake_tasks do
          load "tasks/routes.rake"
          load "tasks/css2sass.rake"
        end
      end
    end
  end
end

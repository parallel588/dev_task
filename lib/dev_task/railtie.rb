module DevTask
  class Railtie < Rails::Railtie

    rake_tasks do
      load "path/to/my_railtie.tasks"
    end

  end
end

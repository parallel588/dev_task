require 'rails/application/route_inspector'

class String

  def red; colorize(self, "\e[1m\e[31m"); end
  def green; colorize(self, "\e[1m\e[32m"); end
  def dark_green; colorize(self, "\e[32m"); end
  def yellow; colorize(self, "\e[1m\e[33m"); end
  def blue; colorize(self, "\e[1m\e[34m"); end
  def dark_blue; colorize(self, "\e[34m"); end
  def pur; colorize(self, "\e[1m\e[35m"); end
  def colorize(text, color_code)  "#{color_code}#{text}\e[0m" end
end


namespace :dev_task do
  desc "Alt routes"
  task :nroutes => :environment do
    Rails.application.reload_routes!
    all_routes = Rails.application.routes.routes
    inspector = Rails::Application::RouteInspector.new

    routes = inspector.collect_routes(all_routes)
    name_width = routes.map{ |r| r[:name].length }.max
    verb_width = routes.map{ |r| r[:verb].length }.max
    path_width = routes.map{ |r| r[:path].length }.max

    group_routes = routes.group_by{ |j| j[:reqs].to_s.split("#").first.to_s}
    group_routes.each do |controller, _routes|
      puts controller.to_s.upcase.dark_green
      puts ('-'*(name_width+verb_width+path_width+30)).dark_green
      _routes.each do |r|
        puts "#{r[:name].rjust(name_width)} #{r[:verb].ljust(verb_width)} #{r[:path].ljust(path_width)} #{r[:reqs]}"
      end
    end
  end
end

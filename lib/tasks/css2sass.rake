# encoding: utf-8
require 'sass/css'

namespace :dev_task do

  desc "Convert css -> scss "
  task :css2scss, [ :input, :output, :prefix ] => :environment  do |t, args|
    return "File is not found" if args.input.to_s.blank?
    @input_file_path = File.expand_path args.input.to_s
    puts @input_file_path
    @prefix = args.prefix.blank? ? "" : args.prefix.to_s

    if File.exist?(@input_file_path)
      begin
        @scss = DevTask::Css2scss.convert(File.open(@input_file_path, 'r').read, { :prefix => @prefix })

        unless args.output.blank?
          File.open(File.expand_path( args.output), "w+") do |f|
            f << @scss
          end
        else
          puts "!"*90
          puts @scss
          puts "!"*90
        end

      rescue Sass::SyntaxError => e
        puts "!"*90
        puts "[ CSS -> SCSS ] #{e}"
      end
    else
      puts "!"*90
      puts "File is not exist: #{@input_file_path}"
    end

  end


end

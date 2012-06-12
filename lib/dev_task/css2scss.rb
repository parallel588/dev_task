# encoding: utf-8
require 'sass/css'

module DevTask
  class Css2scss
    class << self
      def convert(css, options = { })
        @scss =  Sass::CSS.new(css).render(:scss)

        @scss.gsub!(/url\(.*?\)/){ |v|
          _file = (v.match(/([^\/]+)\)/) && $1).gsub(/'/, '')
          case
          when v =~ /\/images\// then "image-url('#{ _file }')"
          when v =~ /\/fonts\// then  "font-url('#{ _file }')"
          else
            v
          end
        }

        @scss.gsub(/@import url\(([^\)]*).css\);?/){ "@import '#{options[:prefix]}/#{$1}';" }
      rescue Sass::SyntaxError => e
        puts "!"*90
        puts "[ CSS -> SCSS ] #{e}"

      end
    end
  end

end

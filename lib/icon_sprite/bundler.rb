# frozen_string_literal: true

require 'icon_sprite/icon'

module IconSprite
  class Bundler
    def initialize(directory_path)
      @directory_path = directory_path
    end

    def icons_list
      Dir[File.join(@directory_path, '*.svg')]
    end

    def icons
      icons_list.map do |path|
        content = File.read(path)
        name = path.split('/').last.gsub('-', '_').sub(/\.svg\z/, '')
        Icon.new(name, content)
      end
    end

    def build
      Nokogiri::XML::Builder.new do |xml|
        xml.svg(xmlns: 'http://www.w3.org/2000/svg', style: 'display:none') do
          icons.each do |icon|
            xml.symbol(icon.attributes) do
              xml << icon.elements
            end
          end
        end
      end.to_xml
    end
  end
end

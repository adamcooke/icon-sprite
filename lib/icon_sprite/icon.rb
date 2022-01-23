# frozen_string_literal: true

require 'nokogiri'

module IconSprite
  class Icon
    attr_reader :name

    def initialize(name, raw)
      @name = name
      @raw = raw
      @parsed = Nokogiri::XML(raw)
      @svg = @parsed.search('svg').first
    end

    def view_box
      @svg['viewBox']
    end

    def type
      @svg['type']
    end

    def elements
      @svg.elements.to_s
    end

    def attributes
      {
        id: name,
        viewBox: view_box
      }.merge(style_attributes)
    end

    private

    def style_attributes
      case type
      when 'stroke'
        { fill: 'none', stroke: 'currentColor' }
      else
        { fill: 'currentColor', stroke: 'none' }
      end
    end
  end
end

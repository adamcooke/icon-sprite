# frozen_string_literal: true

require File.expand_path('lib/icon_sprite/version', __dir__)

Gem::Specification.new do |s|
  s.name          = 'icon_sprite'
  s.description   = 'A tiny Ruby library for generating very simple icon sprites'
  s.summary       = s.description
  s.homepage      = 'https://github.com/adamcooke/icon_sprite'
  s.licenses      = ['MIT']
  s.version       = IconSprite::VERSION
  s.files         = Dir.glob('{lib,db}/**/*')
  s.executables   = ['icon_sprite']
  s.require_paths = ['lib']
  s.authors       = ['Adam Cooke']
  s.email         = ['me@adamcooke.io']
  s.add_dependency  'nokogiri'
end

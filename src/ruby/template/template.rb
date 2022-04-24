# frozen_string_literal: true

require 'erb'
require 'haml'
require 'slim'

puts '=== ERB ==='
template = ERB.new(File.read('src/ruby/template/templates/index.html.erb'))
puts template.result_with_hash(name: 'ERB')

puts '=== Haml ==='
puts Haml::Engine.new(File.read('src/ruby/template/templates/index.html.haml')).render(Object.new, name: 'Haml')

puts '=== Slim ==='
puts Slim::Template.new('src/ruby/template/templates/index.html.slim').render(Object.new, name: 'Slim')

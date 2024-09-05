# frozen_string_literal: true

require 'erb'
require 'haml'
require 'slim'

puts '=== ERB ==='
puts ERB.new(File.read('src/ruby/template/templates/index.html.erb')).result_with_hash(name: 'ERB')

puts '=== Haml ==='
puts Haml::Template.new('src/ruby/template/templates/index.html.haml').render(Object.new, name: 'Haml')

puts '=== Slim ==='
puts Slim::Template.new('src/ruby/template/templates/index.html.slim').render(Object.new, name: 'Slim')

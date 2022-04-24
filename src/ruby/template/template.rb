require 'erb'
require 'haml'
require 'slim'

def main
    puts '=== ERB ==='
    template = ERB.new(File.read('src/ruby/template/templates/index.html.erb'))
    puts template.result_with_hash(name: "ERB")

    puts '=== Haml ==='
    puts Haml::Engine.new(File.read('src/ruby/template/templates/index.html.haml')).render(Object.new, name: "Haml")

    puts '=== Slim ==='
    scope = Object.new
    puts Slim::Template.new('src/ruby/template/templates/index.html.slim').render(Object.new, name: "Slim")
end

main

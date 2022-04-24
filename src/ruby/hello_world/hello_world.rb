# frozen_string_literal: true

require 'optparse'
require_relative 'lib/hello'

Options = Struct.new(:name)

args = Options.new("World")

OptionParser.new do |opts|
  opts.banner = "Usage: hello.rb [options]"
  opts.on("--name=NAME", "Name to greet") do |v|
    args.name = v
  end
end.parse!

puts(say_hello(args.name))

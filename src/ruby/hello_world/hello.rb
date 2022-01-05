# frozen_string_literal: true

require 'awesome_print'

require_relative 'lib/hello'

ap ARGV

if ARGV.length > 0
    puts(say_hello(ARGV[0]))
else
    puts(say_hello())
end

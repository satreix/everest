# frozen_string_literal: true

require_relative 'lib/hello'

if ARGV.length > 0
    puts(say_hello(ARGV[0]))
else
    puts(say_hello())
end

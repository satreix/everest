require "cel"

env = Cel::Environment.new(name: :string, group: :string)

begin
  ast = env.compile('name.startsWith("/groups/" + group)') #=> Cel::Types[:bool], which is == :bool
rescue Cel::Error => e
  STDERR.puts("type-check error: #{e.message}")
  raise e
end

prg = env.program(ast)

return_value = prg.evaluate(
  name: Cel::String.new("/groups/acme.co/documents/secret-stuff"),
  group: Cel::String.new("acme.co"),
)

puts return_value #=> true

# frozen_string_literal: true

require_relative '../template'

EXPECTED_OUTPUT = "=== ERB ===
<h1>Hello, ERB!</h1>
=== Haml ===
<h1>Hello, Haml!</h1>
=== Slim ===
<h1>Hello, Slim!</h1>
"

RSpec.describe 'template', 'main' do
  it 'renders templates' do
    expect { system %(./src/ruby/template/template) }
      .to output(EXPECTED_OUTPUT)
      .to_stdout_from_any_process
  end
end

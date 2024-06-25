# frozen_string_literal: true

EXPECTED_OUTPUT = "=== ERB ===
<h1>Hello, ERB!</h1>
=== Haml ===
<h1>Hello, Haml!</h1>
=== Slim ===
<h1>Hello, Slim!</h1>
"

RSpec.describe 'template', 'main' do # rubocop:disable RSpec/DescribeClass, RSpec/DescribeMethod
  it 'renders templates' do
    expect { system %(./src/ruby/template/template.sh) }
      .to output(EXPECTED_OUTPUT)
      .to_stdout_from_any_process
  end
end

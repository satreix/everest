# frozen_string_literal: true

require_relative '../lib/hello'

RSpec.describe '', '#say_hello' do # rubocop:disable RSpec/DescribeClass
  it 'greets the world' do
    expect(say_hello).to eq 'Hello, World!'
  end

  it 'greets a name' do
    expect(say_hello('Ruby')).to eq 'Hello, Ruby!'
  end
end

require_relative '../1_two_sum'
require 'rspec'

RSpec.describe 'two_sum' do
  it 'finds the outputs' do
    input = [
      [2, 7, 11, 15],
      9
    ]
    output = [0, 1]
    expect(two_sum(*input)).to eq(output)
  end
end

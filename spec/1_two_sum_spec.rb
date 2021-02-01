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
  it 'finds the again' do
    input = [
      [3, 2, 4],
      6
    ]
    output = [1, 2]
    expect(two_sum(*input)).to eq(output)
  end
  it 'handles dupes' do
    input = [
      [3, 3],
      6
    ]
    output = [0, 1]
    expect(two_sum(*input)).to eq(output)
  end
end

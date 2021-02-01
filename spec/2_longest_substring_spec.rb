require_relative '../2_longest_substring'
require 'rspec'

RSpec.describe 'longest_substring' do
  it 'finds the outputs' do
    input = ['abcabcbb']
    output = 3

    expect(length_of_longest_substring(*input)).to eq(output)
  end
  it 'finds the again' do
    input = ['bbbbb']
    output = 1

    expect(length_of_longest_substring(*input)).to eq(output)
  end
  it 'answer must be a substring' do
    input = ['pwwkew']
    output = 3

    expect(length_of_longest_substring(*input)).to eq(output)
  end
  it 'works on empty string' do
    input = ['']
    output = 0

    expect(length_of_longest_substring(*input)).to eq(output)
  end
  it 'works on blank string' do
    input = [' ']
    output = 1

    expect(length_of_longest_substring(*input)).to eq(output)
  end
  it 'works on window sized string' do
    input = ['au']
    output = 2

    expect(length_of_longest_substring(*input)).to eq(output)
  end
end

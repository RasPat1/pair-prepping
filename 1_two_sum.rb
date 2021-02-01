# Two Sum: https://leetcode.com/problems/two-sum/

# Solution 1
# Try every possible combnination of 2 values in nums to
# find a pair that adds to the given target
#
# Space:              O(n)
# Time:               O(n^2)
# Can we do better?   Yes.

# Solution 2
# Generate a map from values in nums to a list of their indexes
# Walk through the nums list
# Look in the map for a key with value (target - current_value)
# Make sure you're not using the same element twice.
# Return the indexes.

# Time complexity
# O(map building) +     => O(n)   +
# O(walking) +          => O(n)   +
# O(hash lookup) +      => n*O(1)
# O(two_sum)            =  O(n)
# Can we do better ....... Not in O(), One pass solution

# Space Complexity
# O(orignal num)        => O(n)
# O(indexMap)           => O(n)
# O(Reult)              => O(1)
# O(two_sum)            => O(n)
# Can we do better? ...... Not in O()

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  map = {}
  nums.each_with_index do |val, index|
    map[val] ||= []
    map[val] << index
  end

  nums.each_with_index do |val, index|
    new_target = target - val
    indexes = map[new_target] || []

    # Avoid using the same index twice
    indexes = indexes.reject { |el| el == index }

    return [index, indexes.first] unless indexes.empty?
  end

  [-1, -1] # Ahh!
end

# slow_sum n^2
def two_sum_n2(nums, target)
  nums.each_with_index do |val1, index1|
    nums.each_with_index do |val2, index2|
      next if index1 === index2
      return [index1, index2] if val1 + val2 === target
    end
  end

  [-1, -1]
end

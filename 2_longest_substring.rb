# @param {String} s
# @return {Integer}
# Space complexity
# O(initial substring)            => O(n) +
# O(map)                          => O(n)
# ------                          -------
# O(length_of_longest_substring)  => O(n)
# Can we do better?               No.

# Time Complexity
# O(iterate pointers)            => O(2n)                 -> O(n) +
# O(add/remove on hash map)      => 2n * O(1)             -> O(n) +
# O(Compute if valid substring)  => 2n * O(alphabet size) -> O(n) +
# -----------------------------  ----------------------------------
# O(length_of_longest_substring) => O(n)
def length_of_longest_substring(s)
  return s.size if s.size <= 1

  left_index = right_index = -1

  map = {}
  max_size = 0

  valid_map = proc { map.all? { |_char, count| count <= 1 } }

  while right_index < s.size && left_index <= s.size - max_size
    if valid_map.call
      window_size = right_index - left_index
      max_size = [max_size, window_size].max

      right_index += 1
      add(map, s[right_index])
    else
      left_index += 1
      remove(map, s[left_index])
    end

  end

  max_size
end

def add(map, char)
  map[char] ||= 0
  map[char] += 1
end

def remove(map, char)
  map[char] -= 1
end
# Let's start with 2 pointers a "left_index" and a "right_index" pointer
# Both are intialized at the start of the string.
# We'll say -1 is before the first char.
# Expand the right pointer
# As it exapnds add each character to a hash map
# The hash map has the count of each character in your "window"
# The window is the substring between the left and right pointers
# If the window has only 1 instance of each character that is a valid substring
# Save the size of that if it larger than the max
# If the window does not have a valid substring then shrink the window from the left
# Stop once the right pointer hits the end of the array and either we find a valid window
# or the window is smaller than the current max

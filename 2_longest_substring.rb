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

  left_index = right_index = 0

  map = {}
  max_size = 0

  while right_index <= s.size && left_index < s.size - max_size
    window_size = right_index - left_index
    max_size = [max_size, window_size].max

    new_char = s[right_index]
    left_index = map[new_char] + 1 if map.has_key?(new_char) && left_index <= map[new_char]
    map[new_char] = right_index
    right_index += 1
  end

  max_size
end

# Let's start with 2 pointers a "left_index" and a "right_index" pointer
# Both are intialized at the start of the string.
# We'll say -1 is before the first char.
# Add a new character to the hash map and save the position of that character
# If we see it again fast forward to that index
# Stop once the right pointer hits the end of the array and either we find a valid window
# or the window is smaller than the current max

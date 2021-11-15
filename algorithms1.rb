# 1
# Given two sorted arrays, merge the second array into the first array while ensuring that the first array remains sorted. Do not use any built-in sort methods.

# Input :
# A : [1, 5, 8]
# B : [6, 9]

# Modified A : [1, 5, 6, 8, 9]

def merge_sorted_arrays(array1, array2)
  index = 0  # to iterate through array1
  while !array2.empty? do
    if index < array1.length  # this condition avoids indexing past the last number in array1
      if array2[0] <= array1[index]
        array1.insert(index, array2.shift)  # move the number at array2[0] into array1 at the current index (array2's numbers shift left)
        index += 1  # to move the index one number past the inserted number
      end
      index += 1
    else
      array1 << array2.shift  # to catch (all) the last number(s) in array2 that is (are) greater than the last number in array1
    end
  end
  array1
end

p merge_sorted_arrays([1, 5, 8], [6, 9])  # => [1, 5, 6, 8, 9]
p merge_sorted_arrays([-2, 3, 4, 12], [-3, 0, 12])  # => [-3, -2, 0, 3, 4, 12, 12]
p merge_sorted_arrays([1, 2, 3, 4], [3, 4, 5, 6, 7])  # => [1, 2, 3, 3, 4, 4, 5, 6, 7]
p merge_sorted_arrays([], [10, 13, 18, 26])  # => [10, 13, 18, 26]
p merge_sorted_arrays([4, 6, 8, 10], [])  # => [4, 6, 8, 10]
p merge_sorted_arrays([-1, -1, -1, -1], [-1, -1, -1, -1])  # => [-1, -1, -1, -1, -1, -1, -1, -1]
p merge_sorted_arrays([-1, -1, -1, -1], [1, 1, 1, 1])  # => [-1, -1, -1, -1, 1, 1, 1, 1]
p merge_sorted_arrays([-11, 12], [0, 19])  # => [-11, 0, 12, 19]
p merge_sorted_arrays([], [])  # => []

#2
# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

# Example 1:

# Input: ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
# Note:

# All given inputs are in lowercase letters a-z.

def longest_common_prefix(string_array)
  if string_array.include?("")
    return ""  # no common prefix if input array contains an empty string, so we break out
  end
  shortest_string_length = string_array.min.length  # we only need to match as many characters as the shortest string in the input array
  common_prefix = ""
  prefix_match = true
  char_index = 0  # to index through each string's characters
  while char_index < shortest_string_length && prefix_match do
    index = 1  # to start the comparison with the second string
    while index < string_array.length && prefix_match do
      if string_array[0][char_index] != string_array[index][char_index]
        prefix_match = false  # to break out of the loops
      end
      index += 1
    end
    if prefix_match
      common_prefix += string_array[0][char_index]  # if all strings in the input array matched at char_index, we have a common prefix
    end
    char_index += 1
  end
  common_prefix
end

p longest_common_prefix(["flower", "flow", "flight"])  # => "fl"
p longest_common_prefix(["dog", "racecar", "car"])  # => ""
p longest_common_prefix(["mammal", "mammary", "madam", "master", "madder"])  # => "ma"
p longest_common_prefix(["boy", "", "girl", ""])  # => ""
p longest_common_prefix(["123456789", "12345678", "1234567", "123456", "12345", "1234"])  # => "1234"
p longest_common_prefix(["maratical", "marat", "marta", "mars"])  # => "mar"
p longest_common_prefix(["hello", "hello", "hello", "hello"])  # => "hello"

#3
# Given two strings, return true if they are anagrams of each other, and false if they are not. An anagram is a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.

# Do not use any built-in sort methods.

# Input: “silent”, “listen”
# Output: true

# Input: “frog”, “bear”
# Output: false

def anagrams?(string1, string2)
  # we create two hashes from string1 and string2 to tally the # of times each letter/character occurs - if the hashes are equal, the strings are anagrams
  string1_tally = {}
  string2_tally = {}
  string1.each_char { |char| string1_tally[char] ? string1_tally[char] += 1 : string1_tally[char] = 1 }  # create tally hash for string1
  string2.each_char { |char| string2_tally[char] ? string2_tally[char] += 1 : string2_tally[char] = 1 }  # create tally hash for string2
  string1_tally == string2_tally  # returns true if both string tallies are equal, returns false otherwise
end

p anagrams?("silent", "listen")  # => true
p anagrams?("frog", "bear")  # => false
p anagrams?("marat", "marta")  # => true
p anagrams?("hello", "hell")  # => false
p anagrams?("x", "")  # => false
p anagrams?("", "")  # => true

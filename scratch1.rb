#1
# Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

# Example 1:
# Input: [1,2,3]
# Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

# Example 2:
# Input: [0,1]
# Output: [[0,1],[1,0]]

# Example 3:
# Input: [1]
# Output: [[1]]

# THIS CODE DOES NOT WORK YET - NEED RECURSION
# def permute(num_array)
#   permutations = []  # array to hold all the permutations
#   index_outer = 0
#   while index_outer < num_array.length do
#     permutation = [num_array[index_outer]]  # array to hold each permutation
#     index_inner = 0
#     while index_inner < num_array.length do
#       if index_inner != index_outer
#         permutation << num_array[index_inner]
#       end
#       index_inner += 1
#     end
#     permutations << permutation
#     index_outer += 1
#   end
#   permutations  
# end

# p permute([1, 2, 3, 4])  # should generate 4! = 24 permutations
# p permute([1, 2, 3])  # => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3. 2. 1]]
# p permute([0, 1])  # => [[0, 1], [1, 0]]
# p permute([1])  # => [[1]]

# JUST SOME PRACTICE

(1..4).to_a.permutation { |num| p num }
p (1..4).to_a.shift
p (1..4).to_a.rotate

books = ["Pinocchio", "Black Beauty", "Tom Sawyer", "Women", "Night"]

p books.each_with_object({}) { |word, hash| hash[word] = word.length }  # => {"Pinocchio"=>9, "Black Beauty"=>12, "Tom Sawyer"=>10, "Women"=>5, "Night"=>5}

p (1..10).reduce(:+)  # 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55
p (1..6).reduce(:*)  # 6! = 6 * 5 * 4 * 3 * 2 * 1 = 720
p (1..5).map { |num| num * num }  # => [1, 4, 9, 16, 25]

p "Maratik".chars.rotate(4).join  # => "tikMara"

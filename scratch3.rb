p (1..1000).select { |num| (Integer.sqrt(num)) ** 2 == Integer.sqrt(num ** 2) }  # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# ~~~

# Write a method to merge two sorted arrays of integers into one sorted array (with duplicates retained).

# Inputs: [-1, 2, 3, 7, 9], [0, 1, 1, 3, 4, 9]
# Output: [-1, 0, 1, 1, 2, 3, 3, 4, 7, 9, 9]

# Implement this in various ways for practice.

def merge_sorted(nums1, nums2)
  sorted = []
  
  while nums1.any? || nums2.any?
    if nums1.any? && (nums2.empty? || nums1.first <= nums2.first)
      sorted << nums1.shift
    elsif nums2.any? && (nums1.empty? || nums2.first <= nums1.first)
      sorted << nums2.shift
    end
  end

  sorted
end

require 'benchmark'

p merge_sorted([-1, 2, 3, 7, 9], [0, 1, 1, 3, 4, 9])  # => [-1, 0, 1, 1, 2, 3, 3, 4, 7, 9, 9]
p Benchmark.measure { merge_sorted([-1, 2, 3, 7, 9], [0, 1, 1, 3, 4, 9]) }  # 1.3e-5 seconds
p merge_sorted([-100, -50, 0, 50, 100], [-101, -99, -51, -49, -1, 1, 49, 51, 99, 101])  # => [-101, -100, -99, -51, -50, -49, -1, 0, 1, 49, 50, 51, 99, 100, 101]
p Benchmark.measure { merge_sorted([-100, -50, 0, 50, 100], [-101, -99, -51, -49, -1, 1, 49, 51, 99, 101]) }  # 5e-6 seconds
p merge_sorted([1, 2, 3, 4], [5, 6, 7, 8])  # => [1, 2, 3, 4, 5, 6, 7, 8]
p merge_sorted([1, 3, 5, 7], [2, 4, 6, 8])  # => [1, 2, 3, 4, 5, 6, 7, 8]
p merge_sorted([-1, 0, 1], [0, 1, 2])  # => [-1, 0, 0, 1, 1, 2]
p merge_sorted([-17, -13, 25], [-7, 1, 18, 23])  # => [-17, -13, -7, 1, 18, 23, 25]
p merge_sorted([1, 1, 1], [1, 1, 1])  # => [1, 1, 1, 1, 1, 1]
p merge_sorted([1, 2], [1, 2])  # => [1, 1, 2, 2]
p merge_sorted([], [-2, 1, 5])  # => [-2, 1, 5]
p merge_sorted([-2], [1, 5])  # => [-2, 1, 5]
p merge_sorted([-4, 4, 20], [])  # => [-4, 4, 20]
p merge_sorted([], [])  # => []
p merge_sorted([1], [])  # => [1]
p merge_sorted([], [1])  # => [1]

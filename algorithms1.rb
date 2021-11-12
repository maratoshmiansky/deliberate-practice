# 1
# Given two sorted arrays, merge the second array into the first array while ensuring that the first array remains sorted. Do not use any built-in sort methods.

# Input :
# A : [1, 5, 8]
# B : [6, 9]

# Modified A : [1, 5, 6, 8, 9]

def merge_sorted_arrays(array1, array2)
  index = 0  # to iterate through array1
  while array2.length > 0 && index < array1.length do  # the second condition avoids indexing past the last number in array1
    if array2[0] <= array1[index]
      array1.insert(index, array2.shift)  # move the number at array2[0] into array1 at the current index (array2's numbers shift left)
      index += 1  # to move the index one number past the inserted number
    end
    index += 1
  end
  while !array2.empty? do
    array1 << array2.shift  # to catch (all) the last number(s) in array2 that is (are) greater than the last number in array1
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
p merge_sorted_arrays([], [])  # => []

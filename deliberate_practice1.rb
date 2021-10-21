# ARRAYS

#1
# Write a function that accepts an array of numbers, and returns an array of the products of every pair of numbers from the array.

# Example:
# Input: [3, 4, 5, 6]
# Output: [12, 15, 18, 20, 24, 30]
# Explanation: (3 * 4, 3 * 5, 3 * 6, 4 * 5, 4 * 6, 5 * 6

def pair_products(array)
  pairs = []
  index1 = 0

  while index1 < array.length
    index2 = index1 + 1
    while index2 < array.length
      pairs << array[index1] * array[index2]
      index2 += 1
    end
    index1 += 1
  end
  pairs
end

p pair_products([3, 4, 5, 6]) # => [12, 15, 18, 20, 24, 30]

#2
# Write a function that accepts two arrays of numbers, and returns an array of the products of every number from the first array multiplied by every number of the second array:
# Example:
# Input: Two arrays: [1, 2], [3, 4, 5]
# Output: [3, 4, 5, 6, 8, 10]
# Explanation: (1 * 3, 1 * 4, 1 * 5, 2 * 3, 2 * 4, 2 * 5)

def products_both(array1, array2)
  products = []
  index1 = 0

  while index1 < array1.length
    index2 = 0
    while index2 < array2.length
      products << array1[index1] * array2[index2]
      index2 += 1
    end
    index1 += 1
  end
  products
end

p products_both([1, 2], [3, 4, 5])  # => [3, 4, 5, 6, 8, 10]

#3
# Write a function that accepts an array of numbers and returns true or false, depending on whether there is a pair of two numbers that add up to 10.

# Examples:
# Input: [2, 4, 6, 7]
# Output: true (because 4 + 6 == 10)

# Second Example:
# Input: [1, 2, 3, 4]
# Output: false (because there is no combination of two numbers that add up to 10)

def pair_sums_to_10(array)
  sums = []
  index1 = 0

  while index1 < array.length
    index2 = index1 + 1
    while index2 < array.length
      sums << array[index1] + array[index2]
      index2 += 1
    end
    index1 += 1
  end
  sums.include?(10)
end

p pair_sums_to_10([2, 4, 6, 7])  # => true
p pair_sums_to_10([1, 2, 3, 4])  # => false

#4
# Write a function that accepts an array of numbers, and returns the largest product of any pair of numbers within a given array.

# Example:
# Input: [5, -2, 1, -9, -7, 2, 6]
# Output: 63
# Explanation: (This is -9 * -7)

def largest_pair_product(array)
  products = []
  index1 = 0

  while index1 < array.length
    index2 = index1 + 1
    while index2 < array.length
      products << array[index1] * array[index2]
      index2 += 1
    end
    index1 += 1
  end
  products.max
end

p largest_pair_product([5, -2, 1, -9, -7, 2, 6])  # -9 * -7 = 63
p largest_pair_product([-100, -10, -1, 0, 1, 10, 100])  # -100 * -10 = 10 * 100 = 1000

#5
# Write a function that accepts two arrays of numbers, and returns the largest sum of a number from the first array added to a number from the second array.

# Example:
# Input: Two arrays: [5, 2, 1], [7, 8, 4, 1]
# Output: 13
# Explanation: (5 from the first array + 8 from the second array)

def largest_sum(array1, array2)
  array1.max + array2.max
end

p largest_sum([5, 2, 1], [7, 8, 4, 1])  # 5 + 8 = 13
p largest_sum([1, 3, 5, 7, 9], [14, 9, -3, 0, 1, 12])  # 9 + 14 = 23

#6
# Write a function that accepts two arrays of numbers, and returns an array that is the “intersection” of the two arrays, meaning an array of the numbers that are shared by the two original arrays.

# Example: Two arrays: [5, 4, 3, 2, 1], [0, 2, 4, 6]
# Output: [2, 4] (or [4, 2])
# Explanation: 2 and 4 are the only values shared by both input arrays.

def intersection(array1, array2)
  both = []
  index = 0
  while index < array1.length
    if array2.include?(array1[index]) && !both.include?(array1[index])
      both << array1[index]
    end
    index += 1
  end
  both
end

p intersection([5, 4, 3, 2, 1], [0, 2, 4, 6])  # => [4, 2]
p intersection([1, 2, 1, 2, 1, 2], [1, 2, 3, 4])  # => [1, 2]
p intersection([17, 31, 9], [8, 24, 13])  # => []

# HASHES

#9
# Write a function that accepts a string and returns a hash table displaying the frequency of each character.

# Example:
# Input: "abcdbcabcdcbaz"
# Output: {"a"=>3, "b"=>4, "c"=>4, "d"=>2, "z"=>1}

def frequency(string)
  freqs = {}
  string.each_char { |letter| freqs[letter] ? freqs[letter] += 1 : freqs[letter] = 1 }
  freqs
end

p frequency("abcdbcabcdcbaz")  # => {"a"=>3, "b"=>4, "c"=>4, "d"=>2, "z"=>1}
p frequency("supercalafrajalisticexpialidocious")  # => {"s"=>3, "u"=>2, "p"=>2, "e"=>2, "r"=>2, "c"=>3, "a"=>5, "l"=>3, "f"=>1, "j"=>1, "i"=>5, "t"=>1, "x"=>1, "d"=>1, "o"=>2}

#10
# Write a function that accepts a hash table of political candidates and their number of votes and return the candidate with the most votes.
# Example:
# Input: {"Gutierrez": 954, "Johnson": 1005, "Warren": 333, "Bloomberg": 5}
# Output: "Johnson"

def most_votes(votes)
  votes.key(votes.values.max).to_s
end

p most_votes({ "Gutierrez": 954, "Johnson": 1005, "Warren": 333, "Bloomberg": 5 })  # => "Johnson"
p most_votes({ "Marat": 1001, "Julie": 931, "Edgar": 213, "Marta": 1001 })  # => "Marat" (only returns the first max value)

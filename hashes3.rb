#1
# Write a function that accepts a hash table and returns an array containing all the keys and values as a simple list. Like this:
# Input: {"a": 1, "b": 2, "c": 3, "d": 4}
# Output: ["a", 1, "b", 2, "c", 3, "d", 4]

def hash_to_array(hash)
  array = []
  index = 0
  hash.each do |key, value|
    array[index] = key
    array[index + 1] = value
    index += 2
  end
  array
end

p hash_to_array({"a": 1, "b": 2, "c": 3, "d": 4})  # this returns the string keys as symbols in the array
p hash_to_array({"a" => 1, "b" => 2, "c" => 3, "d" => 4})  # this returns the string keys as strings in the array

#2
# Write a function that accepts a hash table and returns an array of subarrays, where each subarray contains the key and value of each pair.
# Input: {"chair": 100, "book": 14, "sofa": 55}
# Output: [ ["chair", 100], ["book", 14], ["sofa", 55] ]

def hash_to_array2(hash)
  array = []
  hash.each do |key, value|
    array << [key, value]
  end
  array
end

p hash_to_array2({"a": 1, "b": 2, "c": 3, "d": 4})  # this returns the string keys as symbols in the subarrays
p hash_to_array2({"a" => 1, "b" => 2, "c" => 3, "d" => 4})  # this returns the string keys as strings in the subarrays



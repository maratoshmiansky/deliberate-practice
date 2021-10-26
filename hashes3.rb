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

#3
# Let's do the inverse of the previous exercise. Write a function that accepts an array of subarrays, and return a hash table - in this format:
# Input: [ [1, 3], [8, 9], [2, 16] ]
# Output: becomes {1: 3, 8: 9, 2: 16}

def array_to_hash(array)
  hash = {}
  array.each { |subarray| hash[subarray[0]] = subarray[1] }
  hash
end

p array_to_hash([[1, 3], [8, 9], [2, 16]])  # => {1 => 3, 8 => 9, 2 => 16}
p array_to_hash([["I", 1], ["me", 2], ["mine", 3]])  # => {"I" => 1, "me" => 2, "mine" => 3}

#4
# Write a function that accepts a hash table and returns a new hash table with the keys and values flipped:
# Input: {"a": 1, "b": 2, "c": 3}
# Output: {1: "a", 2: "b", 3: "c"}

def flip_hash(hash)
  flipped_hash = {}
  hash.each { |key, value| flipped_hash[value] = key }
  flipped_hash
end

p flip_hash({"a": 1, "b": 2, "c": 3})  # string keys are converted to symbol values
p flip_hash({"a" => 1, "b" => 2, "c" => 3})  # string keys become string values
p flip_hash({"Joe" => 1, "Jim" => 2, "Jack" => 1})  # => {1 => "Jack", 2 => "Jim"}
p flip_hash({1 => "Joe", 2 => "Jim", 1 => "Jack"})  # => {"Jack" => 1, "Jim" => 2}

# 5
# Write a function that accepts an array of strings and returns a hash table containing the number of times each string occurs:
# Input: ["do", "or", "do", "not"]
# Output: {"do": 2, "or": 1, "not": 1}

def tally_string_array(array)
  string_hash = {}
  array.each { |string| string_hash[string] ? string_hash[string] += 1 : string_hash[string] = 1 }
  string_hash
end

p tally_string_array(["do", "or", "do", "not"])  # => {"do" => 2, "or" => 1, "not" => 1}
p tally_string_array(["pink", "purple", "yellow", "purple", "yellow", "white", "pink"])  # => {"pink" => 2, "purple" => 2, "yellow" => 2, "white" => 1}
p tally_string_array("I am the man who is the man who tells a man to man up, man".split(" "))  # => {"I" => 1, "am" => 1, "the" => 2, "man" => 5, "who" => 2, "is" => 1, "tells" => 1, "a" => 1, "to" => 1, "up," => 1}


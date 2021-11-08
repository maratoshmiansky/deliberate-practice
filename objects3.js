// OBJECTS3 (Ruby hash problems refactored for JavaScript)

//1
// Write a function that accepts a hash table and returns an array containing all the keys and values as a simple list. Like this:
// Input: {"a": 1, "b": 2, "c": 3, "d": 4}
// Output: ["a", 1, "b", 2, "c", 3, "d", 4]

// def hash_to_array(hash)
//   array = []
//   index = 0
//   hash.each do |key, value|
//     array[index] = key
//     array[index + 1] = value
//     index += 2
//   end
//   array
// end

// p hash_to_array({"a": 1, "b": 2, "c": 3, "d": 4})  # this returns the string keys as symbols in the array
// p hash_to_array({"a" => 1, "b" => 2, "c" => 3, "d" => 4})  # this returns the string keys as strings in the array

//2
// Write a function that accepts a hash table and returns an array of subarrays, where each subarray contains the key and value of each pair.
// Input: {"chair": 100, "book": 14, "sofa": 55}
// Output: [ ["chair", 100], ["book", 14], ["sofa", 55] ]

// def hash_to_array2(hash)
//   array = []
//   hash.each { |key, value| array << [key, value] }
//   array
// end

// p hash_to_array2({"a": 1, "b": 2, "c": 3, "d": 4})  # this returns the string keys as symbols in the subarrays
// p hash_to_array2({"a" => 1, "b" => 2, "c" => 3, "d" => 4})  # this returns the string keys as strings in the subarrays

//3
// Let's do the inverse of the previous exercise. Write a function that accepts an array of subarrays, and return a hash table - in this format:
// Input: [ [1, 3], [8, 9], [2, 16] ]
// Output: becomes {1: 3, 8: 9, 2: 16}

// def array_to_hash(array)
//   hash = {}
//   array.each { |subarray| hash[subarray[0]] = subarray[1] }
//   hash
// end

// p array_to_hash([[1, 3], [8, 9], [2, 16]])  # => {1 => 3, 8 => 9, 2 => 16}
// p array_to_hash([["I", 1], ["me", 2], ["mine", 3]])  # => {"I" => 1, "me" => 2, "mine" => 3}

//4
// Write a function that accepts a hash table and returns a new hash table with the keys and values flipped:
// Input: {"a": 1, "b": 2, "c": 3}
// Output: {1: "a", 2: "b", 3: "c"}

// def flip_hash(hash)
//   flipped_hash = {}
//   hash.each { |key, value| flipped_hash[value] = key }
//   flipped_hash
// end

// p flip_hash({"a": 1, "b": 2, "c": 3})  # string keys are converted to symbol values
// p flip_hash({"a" => 1, "b" => 2, "c" => 3})  # string keys become string values
// p flip_hash({"Joe" => 1, "Jim" => 2, "Jack" => 1})  # => {1 => "Jack", 2 => "Jim"}
// p flip_hash({1 => "Joe", 2 => "Jim", 1 => "Jack"})  # => {"Jack" => 1, "Jim" => 2}

// 5
// Write a function that accepts an array of strings and returns a hash table containing the number of times each string occurs:
// Input: ["do", "or", "do", "not"]
// Output: {"do": 2, "or": 1, "not": 1}

// def tally_string_array(array)
//   string_hash = {}
//   array.each { |string| string_hash[string] ? string_hash[string] += 1 : string_hash[string] = 1 }
//   string_hash
// end

// p tally_string_array(["do", "or", "do", "not"])  # => {"do" => 2, "or" => 1, "not" => 1}
// p tally_string_array(["pink", "purple", "yellow", "purple", "yellow", "white", "pink"])  # => {"pink" => 2, "purple" => 2, "yellow" => 2, "white" => 1}
// p tally_string_array("I am the man who is the man who tells a man to man up, man".split(" "))  # => {"I" => 1, "am" => 1, "the" => 2, "man" => 5, "who" => 2, "is" => 1, "tells" => 1, "a" => 1, "to" => 1, "up," => 1}

//6
// Write a function that accepts an array of products and returns a hash table where the id numbers are the keys, and the products hash tables are the values.
// Input: [ {id: 1, product: "table", price: 32}, {id: 2, product: "chair", price: 12}, {id: 3, product: "sofa", price: 100} ]
// Output: {1: {id: 1, product: "table", price: 32}, 2: {id: 2, product: "chair", price: 12}, 3: {id: 2, product: "sofa", price: 100} }

// def hash_array_to_hash(array)
//   output_hash = {}
//   array.each { |hash| output_hash[hash[:id]] = hash }
//   output_hash
// end

// p hash_array_to_hash([ {id: 1, product: "table", price: 32}, {id: 2, product: "chair", price: 12}, {id: 3, product: "sofa", price: 100} ])  # => {1 => {:id => 1, :product => "table", :price => 32}, 2 => {:id => 2, :product => "chair", :price => 12}, 3 => {:id => 3, :product => "sofa", :price => 100}}

//7
// Write a function that accepts TWO parameters, an array and a number. The function should return a hash table, where each item in the array is a key, and the number is a value.
// Inputs: ["a", "e", "i", "o", "u"], 1
// Output: {"a": 1, "e": 1, "i": 1, "o": 1, "u": 1}

// def array_num_hash(array, number)
//   output_hash = {}
//   array.each { |element| output_hash[element] = number }
//   output_hash
// end

// p array_num_hash(["a", "e", "i", "o", "u"], 1)  # => {"a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1}

//8
// Write a function that accepts a string and returns a hash table of how many of each character there are:
// Input: "bookkeeper"
// Output: {"b" => 1, "o" => 2, "k" => 2, "e" => 3, "p" => 1, "r" => 1}

// def char_tally(string)
//   output_hash = {}
//   string.each_char { |letter| output_hash[letter] ? output_hash[letter] += 1 : output_hash[letter] = 1 }
//   output_hash
// end

// p char_tally("bookkeeper")  # => {"b" => 1, "o" => 2, "k" => 2, "e" => 3, "p" => 1, "r" => 1}
// p char_tally("maratical")  # => {"m" => 1, "a" => 3, "r" => 1, "t" => 1, "i" => 1, "c" => 1, "l" => 1}

//9
// Write a function that accepts an array of books and returns a hash table of how many times each author occurs:
// Input: [ {title: "Great Book", author: "John Smith"}, {title: "1984", author: "George Orwell"}, {title: "Awesome Book", author: "John Smith"} ]
// Output: {"John Smith" => 2, "George Orwell" => 1}

// def author_times(array)
//   tally = {}
//   array.each { |hash| tally[hash[:author]] ? tally[hash[:author]] += 1 : tally[hash[:author]] = 1 }
//   tally
// end

// p author_times([{title: "Great Book", author: "John Smith"}, {title: "1984", author: "George Orwell"}, {title: "Awesome Book", author: "John Smith"}])  # => {"John Smith" => 2, "George Orwell" => 1}

//10
// Write a function that accepts an array of books and returns a hash table where the author is the key, and an array of their book titles are the values
// Input: [ {title: "Great Book", author: "John Smith"}, {title: "1984", author: "George Orwell"}, {title: "Awesome Book", author: "John Smith"} ]
// Output: { "John Smith": ["Great Book, "Awesome Book"], "George Orwell": ["1984"] }

// def author_titles(array)
//   tally = {}
//   array.each { |hash| tally[hash[:author]] ? tally[hash[:author]] << hash[:title] : tally[hash[:author]] = [hash[:title]] }
//   tally
// end

// p author_titles([{title: "Great Book", author: "John Smith"}, {title: "1984", author: "George Orwell"}, {title: "Awesome Book", author: "John Smith"}])  # => {"John Smith" => ["Great Book", "Awesome Book"], "George Orwell" => ["1984"]}

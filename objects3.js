// OBJECTS3 (Ruby hash problems refactored for JavaScript)

//1
// Write a function that accepts a hash table and returns an array containing all the keys and values as a simple list. Like this:
// Input: {"a": 1, "b": 2, "c": 3, "d": 4}
// Output: ["a", 1, "b", 2, "c", 3, "d", 4]

function objectToArray(inputObject) {
  let outputArray = [];
  let index = 0;
  for (const [objectKey, objectValue] of Object.entries(inputObject)) {
    outputArray[index] = objectKey;
    outputArray[index + 1] = objectValue;
    index += 2;
  }
  return outputArray;
}

console.log(objectToArray({ a: 1, b: 2, c: 3, d: 4 })); // => ['a', 1, 'b', 2, 'c', 3, 'd', 4]

//2
// Write a function that accepts a hash table and returns an array of subarrays, where each subarray contains the key and value of each pair.
// Input: {"chair": 100, "book": 14, "sofa": 55}
// Output: [ ["chair", 100], ["book", 14], ["sofa", 55] ]

function objectToArray2(inputObject) {
  return Object.entries(inputObject);
}

console.log(objectToArray2({ chair: 100, book: 14, sofa: 55 })); // => [ [ 'chair', 100 ], [ 'book', 14 ], [ 'sofa', 55 ] ]
console.log(objectToArray2({ a: 1, b: 2, c: 3, d: 4 })); // => [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 4 ] ]

//3
// Let's do the inverse of the previous exercise. Write a function that accepts an array of subarrays, and return a hash table - in this format:
// Input: [ [1, 3], [8, 9], [2, 16] ]
// Output: becomes {1: 3, 8: 9, 2: 16}

function arrayToObject(inputArray) {
  return Object.fromEntries(inputArray);
}

console.log(
  arrayToObject([
    [1, 3],
    [8, 9],
    [2, 16],
  ])
); // => { '1': 3, '2': 16, '8': 9 }
console.log(
  arrayToObject([
    ["I", 1],
    ["me", 2],
    ["mine", 3],
  ])
); // => { I: 1, me: 2, mine: 3 }

//4
// Write a function that accepts a hash table and returns a new hash table with the keys and values flipped:
// Input: {"a": 1, "b": 2, "c": 3}
// Output: {1: "a", 2: "b", 3: "c"}

function flipObject(inputObject) {
  let flippedObject = {};
  for (const [objectKey, objectValue] of Object.entries(inputObject)) {
    flippedObject[objectValue] = objectKey;
  }
  return flippedObject;
}

console.log(flipObject({ a: 1, b: 2, c: 3 })); // => { '1': 'a', '2': 'b', '3': 'c' }
console.log(flipObject({ Joe: 1, Jim: 2, Jack: 1 })); // => { '1': 'Jack', '2': 'Jim' }
console.log(flipObject({ 1: "Joe", 2: "Jim", 3: "Jack" })); // => { Joe: '1', Jim: '2', Jack: '3' }

// 5
// Write a function that accepts an array of strings and returns a hash table containing the number of times each string occurs:
// Input: ["do", "or", "do", "not"]
// Output: {"do": 2, "or": 1, "not": 1}

function tallyStringArray(inputArray) {
  let stringObject = {};
  inputArray.forEach((string) => (stringObject[string] ? stringObject[string]++ : (stringObject[string] = 1)));
  return stringObject;
}

console.log(tallyStringArray(["do", "or", "do", "not"])); // => { do: 2, or: 1, not: 1 }
console.log(tallyStringArray(["pink", "purple", "yellow", "purple", "yellow", "white", "pink"])); // => { pink: 2, purple: 2, yellow: 2, white: 1 }

//6
// Write a function that accepts an array of products and returns a hash table where the id numbers are the keys, and the products hash tables are the values.
// Input: [ {id: 1, product: "table", price: 32}, {id: 2, product: "chair", price: 12}, {id: 3, product: "sofa", price: 100} ]
// Output: {1: {id: 1, product: "table", price: 32}, 2: {id: 2, product: "chair", price: 12}, 3: {id: 2, product: "sofa", price: 100} }

function objectArrayToObject(inputArray) {
  let outputObject = {};
  inputArray.forEach((object) => (outputObject[object.id] = object));
  return outputObject;
}

console.log(
  objectArrayToObject([
    { id: 1, product: "table", price: 32 },
    { id: 2, product: "chair", price: 12 },
    { id: 3, product: "sofa", price: 100 },
  ])
); // => { '1': { id: 1, product: 'table', price: 32 }, '2': { id: 2, product: 'chair', price: 12 }, '3': { id: 3, product: 'sofa', price: 100 } }

//7
// Write a function that accepts TWO parameters, an array and a number. The function should return a hash table, where each item in the array is a key, and the number is a value.
// Inputs: ["a", "e", "i", "o", "u"], 1
// Output: {"a": 1, "e": 1, "i": 1, "o": 1, "u": 1}

function arrayNumObject(inputArray, inputNum) {
  let outputObject = {};
  inputArray.forEach((element) => (outputObject[element] = inputNum));
  return outputObject;
}

console.log(arrayNumObject(["a", "e", "i", "o", "u"], 1)); // => { a: 1, e: 1, i: 1, o: 1, u: 1 }
console.log(arrayNumObject(["1", "2", "3", "4", "5"], 10)); // => { '1': 10, '2': 10, '3': 10, '4': 10, '5': 10 }
console.log(arrayNumObject([1, 2, 3, 4, 5], 10)); // => { '1': 10, '2': 10, '3': 10, '4': 10, '5': 10 }

//8
// Write a function that accepts a string and returns a hash table of how many of each character there are:
// Input: "bookkeeper"
// Output: {"b" => 1, "o" => 2, "k" => 2, "e" => 3, "p" => 1, "r" => 1}

function charTally(inputString) {
  let outputObject = {};
  const inputStringArray = inputString.split("");
  inputStringArray.forEach((letter) => (outputObject[letter] ? outputObject[letter]++ : (outputObject[letter] = 1)));
  return outputObject;
}

console.log(charTally("bookkeeper")); // => { b: 1, o: 2, k: 2, e: 3, p: 1, r: 1 }
console.log(charTally("maratical")); // => { m: 1, a: 3, r: 1, t: 1, i: 1, c: 1, l: 1 }

//9
// Write a function that accepts an array of books and returns a hash table of how many times each author occurs:
// Input: [ {title: "Great Book", author: "John Smith"}, {title: "1984", author: "George Orwell"}, {title: "Awesome Book", author: "John Smith"} ]
// Output: {"John Smith" => 2, "George Orwell" => 1}

function authorTimes(bookArray) {
  let authorTally = {};
  bookArray.forEach((titleAuthor) =>
    authorTally[titleAuthor.author] ? authorTally[titleAuthor.author]++ : (authorTally[titleAuthor.author] = 1)
  );
  return authorTally;
}

console.log(
  authorTimes([
    { title: "Great Book", author: "John Smith" },
    { title: "1984", author: "George Orwell" },
    { title: "Awesome Book", author: "John Smith" },
  ])
); // => { 'John Smith': 2, 'George Orwell': 1 }

//10
// Write a function that accepts an array of books and returns a hash table where the author is the key, and an array of their book titles are the values
// Input: [ {title: "Great Book", author: "John Smith"}, {title: "1984", author: "George Orwell"}, {title: "Awesome Book", author: "John Smith"} ]
// Output: { "John Smith": ["Great Book, "Awesome Book"], "George Orwell": ["1984"] }

function authorTitles(bookArray) {
  let authorTally = {};
  bookArray.forEach((titleAuthor) =>
    authorTally[titleAuthor.author]
      ? authorTally[titleAuthor.author].push(titleAuthor.title)
      : (authorTally[titleAuthor.author] = [titleAuthor.title])
  );
  return authorTally;
}

console.log(
  authorTitles([
    { title: "Great Book", author: "John Smith" },
    { title: "1984", author: "George Orwell" },
    { title: "Awesome Book", author: "John Smith" },
  ])
); // => { 'John Smith': [ 'Great Book', 'Awesome Book' ], 'George Orwell': [ '1984' ] }

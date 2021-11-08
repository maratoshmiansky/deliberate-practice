// OBJECTS2 (Ruby hash problems refactored for JavaScript)

//1
// The following array of hash tables represents a list of books. This will be the basis for Exercises #1 - 6.
// [
// {title: "Hop on Pop", author: "Dr. Seuss", pageCount: 17},
// {title: "Mrs. Dalloway", author: "Virginia Woolf", pageCount: 566},
// {title: "Harry Potter and the Sorcerer's Stone", author: "J. K. Rowling", pageCount: 321},
// {title: "To the Lighthouse", author: "Virginia Woolf", pageCount: 288},
// {title: "Anna Karenina", author: "Leo Tolstoy", pageCount: 825},
// {title: "The Adventures of Tom Sawyer", author: "Mark Twain", pageCount: 390},
// {title: "The Cat in the Hat", author: "Dr. Seuss", pageCount: 24},
// {title: "War and Peace", author: "Leo Tolstoy", pageCount: 1821},
// {title: "Green Eggs and Ham", author: "Dr. Seuss", pageCount: 22},
// {title: "The Adventures of Huckleberry Finn", author: "Mark Twain", pageCount: 406}
// ]
// Write a function that accepts this type of hash table and returns an array containing the title of each book.
// Expected Output:
// [
//   'Hop on Pop',
//   'Mrs. Dalloway',
//   "Harry Potter and the Sorcerer's Stone",
//   'To the Lighthouse',
//   'Anna Karenina',
//   'The Adventures of Tom Sawyer',
//   'The Cat in the Hat',
//   'War and Peace',
//   'Green Eggs and Ham',
//   'The Adventures of Huckleberry Finn'
// ]

const bookList = [
  { title: "Hop on Pop", author: "Dr. Seuss", pageCount: 17 },
  { title: "Mrs. Dalloway", author: "Virginia Woolf", pageCount: 566 },
  { title: "Harry Potter and the Sorcerer's Stone", author: "J. K. Rowling", pageCount: 321 },
  { title: "To the Lighthouse", author: "Virginia Woolf", pageCount: 288 },
  { title: "Anna Karenina", author: "Leo Tolstoy", pageCount: 825 },
  { title: "The Adventures of Tom Sawyer", author: "Mark Twain", pageCount: 390 },
  { title: "The Cat in the Hat", author: "Dr. Seuss", pageCount: 24 },
  { title: "War and Peace", author: "Leo Tolstoy", pageCount: 1821 },
  { title: "Green Eggs and Ham", author: "Dr. Seuss", pageCount: 22 },
  { title: "The Adventures of Huckleberry Finn", author: "Mark Twain", pageCount: 406 },
];

function titles(list) {
  return list.map((book) => book.title);
}

console.log(titles(bookList));

//2
// Write a function that accepts this type of hash table and returns an array of the books whose page counts are greater than 500.
// Expected Output:
// [
//   { title: 'Mrs. Dalloway', author: 'Virginia Woolf', pageCount: 566 },
//   { title: 'Anna Karenina', author: 'Leo Tolstoy', pageCount: 825 },
//   { title: 'War and Peace', author: 'Leo Tolstoy', pageCount: 1821 }
// ]

function has500PagesOrMore(list) {
  return list.filter((book) => book.pageCount > 500);
}

console.log(has500PagesOrMore(bookList));

//3
// Write a function that accepts this type of hash table and returns the total pages of all the books combined.
// Expected Output: 4680

function totalPages(list) {
  return list.map((book) => book.pageCount).reduce((sum, num) => sum + num);
}

console.log(totalPages(bookList));

//4
// Write a function that accepts this type of hash table and returns the total pages of all books written by Dr. Seuss.
// Expected Output: 63

function pagesOfSeuss(list) {
  return list
    .filter((book) => book.author === "Dr. Seuss")
    .map((book) => book.pageCount)
    .reduce((sum, num) => sum + num);
}

console.log(pagesOfSeuss(bookList));

//5
// Write a function that accepts this type of hash table and returns the book with the highest page count.
// Expected Output: {title: "War and Peace", author: "Leo Tolstoy", pageCount: 1821}

function mostPages(list) {
  const highestCount = Math.max(...list.map((book) => book.pageCount)); // determine the highest page count
  return list.filter((book) => book.pageCount === highestCount); // returns an array of book(s) with the highest page count
}

console.log(mostPages(bookList));

//6
// Write a function that accepts this type of hash table and returns an array of strings that contain each book and author in the following format: "Hop on Pop by Dr. Seuss"
// Expected Output:
// [
//   'Hop on Pop by Dr. Seuss',
//   'Mrs. Dalloway by Virginia Woolf',
//   "Harry Potter and the Sorcerer's Stone by J. K. Rowling",
//   'To the Lighthouse by Virginia Woolf',
//   'Anna Karenina by Leo Tolstoy',
//   'The Adventures of Tom Sawyer by Mark Twain',
//   'The Cat in the Hat by Dr. Seuss',
//   'War and Peace by Leo Tolstoy',
//   'Green Eggs and Ham by Dr. Seuss',
//   'The Adventures of Huckleberry Finn by Mark Twain'
// ]

function titlesByAuthor(list) {
  let bookStrings = [];
  list.forEach((book) => bookStrings.push(`${book.title} by ${book.author}`));
  return bookStrings;
}

console.log(titlesByAuthor(bookList));

//7
// Here's an array of strings, with each string representing a vote for a particular political candidate.
// ["Gutierrez", "Johnson", "Johnson", "Johnson", "Gutierrez", "Johnson", "Gutierrez"]
// Write a function that returns a hash table containing the tally of votes for each candidate.
// Expected Output: {"Gutierrez": 3, "Johnson": 4}

function voteTally(candidates) {
  let tally = {};
  candidates.forEach((candidate) => (tally[candidate] ? tally[candidate]++ : (tally[candidate] = 1)));
  return tally;
}

console.log(voteTally(["Gutierrez", "Johnson", "Johnson", "Johnson", "Gutierrez", "Johnson", "Gutierrez"])); // => { Gutierrez: 3, Johnson: 4 }

//8
// Extend the previous function to return the winner of the election (that is, the candidate with the most votes).
// Expected Output: "Johnson"

function winner(candidates) {
  let tally = {};
  candidates.forEach((candidate) => (tally[candidate] ? tally[candidate]++ : (tally[candidate] = 1)));
  const winCount = Math.max(...Object.values(tally)); // determine the highest vote count
  return Object.keys(tally).filter((candidate) => tally[candidate] === winCount); // returns an array of the candidate(s) with the most votes
}

console.log(winner(["Gutierrez", "Johnson", "Johnson", "Johnson", "Gutierrez", "Johnson", "Gutierrez"])); // => [ 'Johnson' ]
console.log(winner(["Marat", "Marta", "Marat", "Marta"])); // => [ 'Marat', 'Marta' ]

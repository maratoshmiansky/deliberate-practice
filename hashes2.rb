#1
# The following array of hash tables represents a list of books. This will be the basis for Exercises #1 - 6.
# [
# {title: "Hop on Pop", author: "Dr. Seuss", pageCount: 17},
# {title: "Mrs. Dalloway", author: "Virginia Woolf", pageCount: 566},
# {title: "Harry Potter and the Sorcerer's Stone", author: "J. K. Rowling", pageCount: 321},
# {title: "To the Lighthouse", author: "Virginia Woolf", pageCount: 288},
# {title: "Anna Karenina", author: "Leo Tolstoy", pageCount: 825},
# {title: "The Adventures of Tom Sawyer", author: "Mark Twain", pageCount: 390},
# {title: "The Cat in the Hat", author: "Dr. Seuss", pageCount: 24},
# {title: "War and Peace", author: "Leo Tolstoy", pageCount: 1821},
# {title: "Green Eggs and Ham", author: "Dr. Seuss", pageCount: 22},
# {title: "The Adventures of Huckleberry Finn", author: "Mark Twain", pageCount: 406}
# ]
# Write a function that accepts this type of hash table and returns an array containing the title of each book.
# Expected Output:
# [
#   'Hop on Pop',
#   'Mrs. Dalloway',
#   "Harry Potter and the Sorcerer's Stone",
#   'To the Lighthouse',
#   'Anna Karenina',
#   'The Adventures of Tom Sawyer',
#   'The Cat in the Hat',
#   'War and Peace',
#   'Green Eggs and Ham',
#   'The Adventures of Huckleberry Finn'
# ]

book_list = [
  { title: "Hop on Pop", author: "Dr. Seuss", page_count: 17 },
  { title: "Mrs. Dalloway", author: "Virginia Woolf", page_count: 566 },
  { title: "Harry Potter and the Sorcerer's Stone", author: "J. K. Rowling", page_count: 321 },
  { title: "To the Lighthouse", author: "Virginia Woolf", page_count: 288 },
  { title: "Anna Karenina", author: "Leo Tolstoy", page_count: 825 },
  { title: "The Adventures of Tom Sawyer", author: "Mark Twain", page_count: 390 },
  { title: "The Cat in the Hat", author: "Dr. Seuss", page_count: 24 },
  { title: "War and Peace", author: "Leo Tolstoy", page_count: 1821 },
  { title: "Green Eggs and Ham", author: "Dr. Seuss", page_count: 22 },
  { title: "The Adventures of Huckleberry Finn", author: "Mark Twain", page_count: 406 },
]

def titles(list)
  list.map { |book| book[:title] }
end

p titles(book_list)

#2
# Write a function that accepts this type of hash table and returns an array of the books whose page counts are greater than 500.
# Expected Output:
# [
#   { title: 'Mrs. Dalloway', author: 'Virginia Woolf', pageCount: 566 },
#   { title: 'Anna Karenina', author: 'Leo Tolstoy', pageCount: 825 },
#   { title: 'War and Peace', author: 'Leo Tolstoy', pageCount: 1821 }
# ]

def has_500_pages_or_more(list)
  list.select { |book| book[:page_count] > 500 }
end

p has_500_pages_or_more(book_list)

#3
# Write a function that accepts this type of hash table and returns the total pages of all the books combined.
# Expected Output: 4680

def total_pages(list)
  list.map { |book| book[:page_count] }.reduce(:+)
end

p total_pages(book_list)

#4
# Write a function that accepts this type of hash table and returns the total pages of all books written by Dr. Seuss.
# Expected Output: 63

def pages_of_Seuss(list)
  list.select { |book| book[:author] == "Dr. Seuss" }.map { |book| book[:page_count] }.reduce(:+)
end

p pages_of_Seuss(book_list)

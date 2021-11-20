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

p ("a".."z").to_a.reverse.join  # => "zyxwvutsrqponmlkjihgfedcba"

alphabet = ("a".."z").to_a
p alphabet.map { |letter| letter + letter.upcase }.join  # => "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabet.select { |letter| alphabet.index(letter).odd? }.join  # => "bdfhjlnprtvxz"
p alphabet.map { |letter| alphabet.index(letter).odd? ? letter : letter.upcase }.join  # => "AbCdEfGhIjKlMnOpQrStUvWxYz"

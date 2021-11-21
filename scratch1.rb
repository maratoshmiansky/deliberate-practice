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
p alphabet.map { |letter| alphabet[-alphabet.index(letter) - 1] }.join  # => "zyxwvutsrqponmlkjihgfedcba" (reverse in place)
p alphabet.reduce("") { |memo, letter| memo += alphabet[-alphabet.index(letter) - 1] }  # => "zyxwvutsrqponmlkjihgfedcba" (also reverse)
p alphabet.each_with_object({}) { |letter, hash| hash[letter] = alphabet.index(letter) }  # returns a hash with each letter as a key and each letter's index as a corresponding value
p (0..25).map { |index| alphabet[index] }.join  # => "abcdefghijklmnopqrstuvwxyz"
p (0..25).each_with_object([]) { |index, array| array << alphabet[index] }.join # => "abcdefghijklmnopqrstuvwxyz"
p (0..25).reduce("") { |string, index| string += alphabet[index] } # => "abcdefghijklmnopqrstuvwxyz"

rockstars = [
              { first_name: "Jim", last_name: "Morrison", band: "The Doors", roles: ["vocals"] },
              { first_name: "Ray", last_name: "Manzarek", band: "The Doors", roles: ["keyboard"] },
              { first_name: "Robbie", last_name: "Krieger", band: "The Doors", roles: ["guitar"] },
              { first_name: "John", last_name: "Densmore", band: "The Doors", roles: ["drums"] },
              { first_name: "Jimi", last_name: "Hendrix", band: "The Jimi Hendrix Experience", roles: ["vocals", "guitar"] },
              { first_name: "Mitch", last_name: "Mitchell", band: "The Jimi Hendrix Experience", roles: ["drums"] },
              { first_name: "Noel", last_name: "Redding", band: "The Jimi Hendrix Experience", roles: ["bass"] },
              { first_name: "Jimmy", last_name: "Page", band: "Led Zeppelin", roles: ["guitar"] },
              { first_name: "Robert", last_name: "Plant", band: "Led Zeppelin", roles: ["vocals"] },
              { first_name: "John Paul", last_name: "Jones", band: "Led Zeppelin", roles: ["bass", "keyboard"] },
              { first_name: "John", last_name: "Bonham", band: "Led Zeppelin", roles: ["drums"] },
              { first_name: "Syd", last_name: "Barrett", band: "Pink Floyd", roles: ["vocals", "guitar"] },
              { first_name: "Roger", last_name: "Waters", band: "Pink Floyd", roles: ["bass", "vocals"] },
              { first_name: "David", last_name: "Gilmour", band: "Pink Floyd", roles: ["guitar", "vocals"] },
              { first_name: "Richard", last_name: "Wright", band: "Pink Floyd", roles: ["keyboard"] },
              { first_name: "Nick", last_name: "Mason", band: "Pink Floyd", roles: ["drums"] },
            ]

rockstars.each { |rockstar| p "#{rockstar[:first_name]} #{rockstar[:last_name]} performed #{rockstar[:roles].join(", ")} for #{rockstar[:band]}." }

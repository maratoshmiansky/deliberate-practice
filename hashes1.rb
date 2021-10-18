#1
# The following hash table represents a particular person: { first_name: "Ada", last_name: "Lovelace", email: "ada.lovelace@email.com" }
# Write a function that accepts this type of hash table and returns the person's email address.
 
# Example:
# Input: { first_name: "Ada", last_name: "Lovelace", email: "ada.lovelace@email.com" }
# Output: "ada.lovelace@email.com"

def return_email(person)
  p person[:email]
end

return_email({ first_name: "Ada", last_name: "Lovelace", email: "ada.lovelace@email.com" })

#2
# The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 }
# Write a function that accepts a hash table like this and adds 200 shirts to the "yellow" category. The function can then return the updated hash table.

def add_200_shirts(shirts)
  shirts[:yellow] += 200
  shirts
end

p add_200_shirts({ red: 500, blue: 615, green: 484, yellow: 332 })  # => { :red=>500, :blue=>615, :green=>484, :yellow=>532 }

#3
# The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 } (same as previous exercise)
# Write a function that accepts 3 parameters: The hash table, a string representing a brand new color, and a number of how many new color shirts there are. The function should then add this color and its number to the hash table, and then return the updated hash table.

def add_shirt(shirts, color, count)
  shirts[color.to_sym] = count
  shirts
end

p add_shirt({ red: 500, blue: 615, green: 484, yellow: 332 }, color = "pink", count = 123)  # => { :red=>500, :blue=>615, :green=>484, :yellow=>332, :pink=>123 }

#4
# The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 } (same as previous exercise)
# Write a function that accepts a hash table like this and returns the total number of shirts in inventory.

def shirt_count(shirts)
  p shirts.values.sum  # convert the shirts hash into an array containing the values, then sum up the values
end

shirt_count({ red: 500, blue: 615, green: 484, yellow: 332 })  # => 1931

#5
# The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 } (same as previous exercise)
# Write a function that accepts a hash table like this and returns the shirt color with the greatest number.

def most_shirts(shirts)
  shirts.key(shirts.values.max)
end

p most_shirts({ red: 500, blue: 615, green: 484, yellow: 332 })  # => :blue

#6
# The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 } (same as previous exercise)
# Write a function that adds 10 to each shirt color, and then return the updated hash table.

def add_10_shirts_to_each_shirt(shirts)
  shirts.each do |key, value|
    shirts[key] += 10
  end
  shirts
end

p add_10_shirts_to_each_shirt({ red: 500, blue: 615, green: 484, yellow: 332 })  # => { :red=>510, :blue=>625, :green=>494, :yellow=>342 }


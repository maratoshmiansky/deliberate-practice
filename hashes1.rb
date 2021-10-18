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

#7
# The following array represents a bad attempt at storing data of U.S. states and their capitals:
# ["Illinois", "Springfield", "New York", "Albany", "Hawaii", "Honolulu", "Colorado": "Denver", "Idaho", "Boise"]
# Write a function that accepts an array in this format and returns the same data as a proper hash table, like this:
# {"Illinois"=>"Springfield", "New York"=>"Albany", "Hawaii"=>"Honolulu", "Colorado"=>"Denver", "Idaho"=>"Boise"}

def states_to_hash(states)
  states_hash = {}
  index = 0
  while index < states.length - 1
    states_hash[states[index]] = states[index + 1]
    index += 2
  end
  states_hash
end

p states_to_hash(["Illinois", "Springfield", "New York", "Albany", "Hawaii", "Honolulu", "Colorado", "Denver", "Idaho", "Boise"])  # => {"Illinois"=>"Springfield", "New York"=>"Albany", "Hawaii"=>"Honolulu", "Colorado"=>"Denver", "Idaho"=>"Boise"}

#8
# The following array contains a record of each vote for a particular political candidate. Each string represents a vote. For example: ["Gutierrez", "Johnson", "Johnson", "Johnson", "Gutierrez", "Johnson", "Gutierrez", "Johnson"]
# Write a function that accepts an array like this and returns a hash table showing how many votes each candidate received, like this:
# {"Gutierrez": 3, "Johnson": 5}

def number_of_votes(votes)
  tally = {}
  votes.each do |name|
    tally[name] ? tally[name] += 1 : tally[name] = 1
  end
  tally
end

p number_of_votes(["Gutierrez", "Johnson", "Johnson", "Johnson", "Gutierrez", "Johnson", "Gutierrez", "Johnson"])  # => {"Gutierrez"=>3, "Johnson"=>5}

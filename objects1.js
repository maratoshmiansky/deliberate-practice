// OBJECTS1 (Ruby hash problems refactored for JavaScript)

//1
// The following hash table represents a particular person: { first_name: "Ada", last_name: "Lovelace", email: "ada.lovelace@email.com" }
// Write a function that accepts this type of hash table and returns the person's email address.

// Example:
// Input: { first_name: "Ada", last_name: "Lovelace", email: "ada.lovelace@email.com" }
// Output: "ada.lovelace@email.com"

function returnEmail(person) {
  console.log(person.email);
}

returnEmail({ firstName: "Ada", lastName: "Lovelace", email: "ada.lovelace@email.com" }); // => ada.lovelace@email.com

//2
// The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 }
// Write a function that accepts a hash table like this and adds 200 shirts to the "yellow" category. The function can then return the updated hash table.

function add200Shirts(shirts) {
  shirts.yellow += 200;
  return shirts;
}

console.log(add200Shirts({ red: 500, blue: 615, green: 484, yellow: 332 })); // => { red: 500, blue: 615, green: 484, yellow: 532 }

//3
// The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 } (same as previous exercise)
// Write a function that accepts 3 parameters: The hash table, a string representing a brand new color, and a number of how many new color shirts there are. The function should then add this color and its number to the hash table, and then return the updated hash table.

function addShirt(shirts, color, count) {
  shirts[color] = count;
  return shirts;
}

console.log(addShirt({ red: 500, blue: 615, green: 484, yellow: 332 }, "pink", 123)); // => { red: 500, blue: 615, green: 484, yellow: 332, pink: 123 }

//4
// The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 } (same as previous exercise)
// Write a function that accepts a hash table like this and returns the total number of shirts in inventory.

function shirtCount(shirts) {
  console.log(Object.values(shirts).reduce((sum, num) => sum + num, 0)); // use .reduce on an array of values of the shirts object to sum the values
}

shirtCount({ red: 500, blue: 615, green: 484, yellow: 332 }); // => 1931

//5
// The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 } (same as previous exercise)
// Write a function that accepts a hash table like this and returns the shirt color with the greatest number.

function mostShirts(shirts) {
  // return Object.keys(shirts).find((key) => shirts[key] === Math.max(...Object.values(shirts))); // only returns the key of the first max value
  const maxValue = Math.max(...Object.values(shirts));
  return Object.keys(shirts).filter((key) => shirts[key] === maxValue); // returns all keys of (duplicate) max values as an array
}

console.log(mostShirts({ red: 500, blue: 615, green: 484, yellow: 332 })); // => [blue]
console.log(mostShirts({ pink: 600, purple: 620, orange: 480, indigo: 620 })); // => [pink, indigo]

//6
// The following hash table represents the inventory of shirts for a clothing store: { red: 500, blue: 615, green: 484, yellow: 332 } (same as previous exercise)
// Write a function that adds 10 to each shirt color, and then return the updated hash table.

function add10ShirtsOfEachColor(shirts) {
  for (const shirtKey in shirts) {
    shirts[shirtKey] += 10;
  }
  return shirts;
}

console.log(add10ShirtsOfEachColor({ red: 500, blue: 615, green: 484, yellow: 332 })); // => { red: 510, blue: 625, green: 494, yellow: 342 }

//7
// The following array represents a bad attempt at storing data of U.S. states and their capitals:
// ["Illinois", "Springfield", "New York", "Albany", "Hawaii", "Honolulu", "Colorado": "Denver", "Idaho", "Boise"]
// Write a function that accepts an array in this format and returns the same data as a proper hash table, like this:
// {"Illinois"=>"Springfield", "New York"=>"Albany", "Hawaii"=>"Honolulu", "Colorado"=>"Denver", "Idaho"=>"Boise"}

function statesToHash(states) {
  let statesHash = {};
  for (let index = 0; index < states.length - 1; index += 2) {
    statesHash[states[index]] = states[index + 1];
  }
  return statesHash;
}

console.log(
  statesToHash([
    "Illinois",
    "Springfield",
    "New York",
    "Albany",
    "Hawaii",
    "Honolulu",
    "Colorado",
    "Denver",
    "Idaho",
    "Boise",
  ])
); // => { Illinois: 'Springfield', 'New York': 'Albany', Hawaii: 'Honolulu', Colorado: 'Denver', Idaho: 'Boise' }

//8
// The following array contains a record of each vote for a particular political candidate. Each string represents a vote. For example: ["Gutierrez", "Johnson", "Johnson", "Johnson", "Gutierrez", "Johnson", "Gutierrez", "Johnson"]
// Write a function that accepts an array like this and returns a hash table showing how many votes each candidate received, like this:
// {"Gutierrez": 3, "Johnson": 5}

// def number_of_votes(votes)
//   tally = {}
//   votes.each { |name| tally[name] ? tally[name] += 1 : tally[name] = 1 }
//   tally
// end

// p number_of_votes(["Gutierrez", "Johnson", "Johnson", "Johnson", "Gutierrez", "Johnson", "Gutierrez", "Johnson"])  # => {"Gutierrez"=>3, "Johnson"=>5}

function numberOfVotes(votes) {
  let tally = {};
  votes.forEach((name) => (tally[name] ? tally[name]++ : (tally[name] = 1)));
  return tally;
}

console.log(
  numberOfVotes(["Gutierrez", "Johnson", "Johnson", "Johnson", "Gutierrez", "Johnson", "Gutierrez", "Johnson"])
); // => { Gutierrez: 3, Johnson: 5 }

//1
// Write a function that accepts an array of numbers, and returns an array of the products of every pair of numbers from the array.

// Example:
// Input: [3, 4, 5, 6]
// Output: [12, 15, 18, 20, 24, 30]
// Explanation: (3 * 4, 3 * 5, 3 * 6, 4 * 5, 4 * 6, 5 * 6

function pairProducts(array) {
  let pairs = [];
  let index1 = 0;

  while (index1 < array.length) {
    let index2 = index1 + 1;
    while (index2 < array.length) {
      pairs.push(array[index1] * array[index2]);
      index2++;
    }
    index1++;
  }
  return pairs;
}

console.log(pairProducts([3, 4, 5, 6])); // => [12, 15, 18, 20, 24, 30]

//2
// Write a function that accepts two arrays of numbers, and returns an array of the products of every number from the first array multiplied by every number of the second array:
// Example:
// Input: Two arrays: [1, 2], [3, 4, 5]
// Output: [3, 4, 5, 6, 8, 10]
// Explanation: (1 * 3, 1 * 4, 1 * 5, 2 * 3, 2 * 4, 2 * 5)

function productsBoth(array1, array2) {
  let products = [];
  let index1 = 0;

  while (index1 < array1.length) {
    let index2 = 0;
    while (index2 < array2.length) {
      products.push(array1[index1] * array2[index2]);
      index2++;
    }
    index1++;
  }
  return products;
}

console.log(productsBoth([1, 2], [3, 4, 5])); // => [3, 4, 5, 6, 8, 10]

//3
// Write a function that accepts an array of numbers and returns true or false, depending on whether there is a pair of two numbers that add up to 10.

// Examples:
// Input: [2, 4, 6, 7]
// Output: true (because 4 + 6 == 10)

// Second Example:
// Input: [1, 2, 3, 4]
// Output: false (because there is no combination of two numbers that add up to 10)

function pairSumsTo10(array) {
  let sums = [];
  let index1 = 0;

  while (index1 < array.length) {
    let index2 = index1 + 1;
    while (index2 < array.length) {
      sums.push(array[index1] + array[index2]);
      index2++;
    }
    index1++;
  }
  return sums.includes(10);
}

console.log(pairSumsTo10([2, 4, 6, 7])); // => true
console.log(pairSumsTo10([1, 2, 3, 4])); // => false

//4
// Write a function that accepts an array of numbers, and returns the largest product of any pair of numbers within a given array.

// Example:
// Input: [5, -2, 1, -9, -7, 2, 6]
// Output: 63
// Explanation: (This is -9 * -7)

function largestPairProduct(array) {
  let products = [];
  let index1 = 0;

  while (index1 < array.length) {
    let index2 = index1 + 1;
    while (index2 < array.length) {
      products.push(array[index1] * array[index2]);
      index2++;
    }
    index1++;
  }
  return Math.max(...products);
}

console.log(largestPairProduct([5, -2, 1, -9, -7, 2, 6])); // -9 * -7 = 63
console.log(largestPairProduct([-100, -10, -1, 0, 1, 10, 100])); // -100 * -10 = 10 * 100 = 1000

//5
// Write a function that accepts two arrays of numbers, and returns the largest sum of a number from the first array added to a number from the second array.

// Example:
// Input: Two arrays: [5, 2, 1], [7, 8, 4, 1]
// Output: 13
// Explanation: (5 from the first array + 8 from the second array)

function largestSum(array1, array2) {
  return Math.max(...array1) + Math.max(...array2);
}

console.log(largestSum([5, 2, 1], [7, 8, 4, 1])); // 5 + 8 = 13
console.log(largestSum([1, 3, 5, 7, 9], [14, 9, -3, 0, 1, 12])); // 9 + 14 = 23

//6
// Write a function that accepts two arrays of numbers, and returns an array that is the “intersection” of the two arrays, meaning an array of the numbers that are shared by the two original arrays.

// Example: Two arrays: [5, 4, 3, 2, 1], [0, 2, 4, 6]
// Output: [2, 4] (or [4, 2])
// Explanation: 2 and 4 are the only values shared by both input arrays.

function intersection(array1, array2) {
  let both = [];
  let index = 0;
  while (index < array1.length) {
    if (array2.includes(array1[index]) && !both.includes(array1[index])) {
      both.push(array1[index]);
    }
    index++;
  }
  return both;
}

console.log(intersection([5, 4, 3, 2, 1], [0, 2, 4, 6])); // => [4, 2]
console.log(intersection([1, 2, 1, 2, 1, 2], [1, 2, 3, 4])); // => [1, 2]
console.log(intersection([17, 31, 9], [8, 24, 13])); // => []

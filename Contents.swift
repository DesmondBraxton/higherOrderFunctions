import UIKit

// BUILT IN CLOSURES
// Higher order functions are functions that takes in another function or return other functions


//map
// map transforms elements in a collection and returns a resulting array

let mapArr = [1,2,3,4]
let squareResults = mapArr.map {
    $0 * $0
}
print(squareResults) // (1,4,9,16)

//filter
// filter returns an array of filtered results based on a given condition

let filterArr = [1,2,3,4,5,6,7]
let filteredResults = filterArr.filter { $0 > 4 } // this takes in an intager and outputs a boolean (int) -> Bool

print(filteredResults)


//sorted

let chars: [Character] = ["z", "a", "d"]
let sortedChars = chars.sorted { $0 < $1} // the less than sign is ascending order, the greater than sign is descending order
print(sortedChars)

//reduce - combines values given a closure
// this function takes in two arguments
let values = [1,2,10]
// the initial value will be represented by 0 and a closure
let sum = values.reduce(0, +)
print(sum)

// compactMap - removes nil values
// checks to see if the entry is is a valid

let grades = ["89","90","ninety","75","eighty"] // [String] = an array of strings
let validGrades = grades.compactMap { Int($0) } // Int(String) is a failable initializer- it returns a nil
print(validGrades) // returns [89,90,75]

// Chaining Closures

let result = [1, nil, 5].compactMap { $0 }.map { $0 * $0}.reduce(0, +)
print(result)


// Challenge Rewrite the built in filter function
// Excercizing my understanding of closures

func customFilter<T>(_ elements: [T], filter: (T) -> (Bool)) -> [T] {
    var filteredResults = [T]()
    for element in elements {
        if filter(element){filteredResults.append(element)}
    }
    return filteredResults
}

let numbers = [1,2,3,4,5,6,7,8,9]
let evenNumbers = customFilter(numbers) { $0 % 2 == 0 }
print(evenNumbers) // returns 2,4,6 and 8

let moreChars: [Character] = ["a","b","a","b"]
let letterAs = customFilter(chars) { $0 == "a" }
print(letterAs)


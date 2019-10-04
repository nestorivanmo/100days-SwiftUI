import UIKit

//Arithmetic operators
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % firstScore

//Operator overloading
/*
 Swift supports operator overloading, which is a fancy way of saying that what an operator does depends on the values you use it with.
 */

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John","Paul"]
let secondHalf = ["George","Ringo"]
let beatles = firstHalf + secondHalf

/*
 Swift is a type safe language, which means it won't let you mix types.
 */

//Compound assignment operators
/*
 Swift has shorthand operators that combine one operator with an assignment, so you can change a variable in place.
*/

var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

//Comparison operators
/*
 Swift has several operators that perform comparison, and these work more or less like you would expect in mathematics.
 */

let someScore = 6
let anotherScore = 4

someScore == anotherScore
someScore != anotherScore
someScore < anotherScore
someScore >= anotherScore

"Taylor" >= "Swift"

//Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    let _ = "BlackJack !"
} else {
    let _ = "Regular cards"
}


if firstCard + secondCard == 2 {
    let _ = "Aces - lucky!"
}else if firstCard + secondCard == 21 {
    let _ = "Blackjack!"
}else {
    let _ = "Regular cards"
}

//Combining conditions
/*
    && and operator
    || or operator
*/

let age1 = 11
let age2 = 21

if age1 > 18 && age2 > 18 {
    let _ = "Both are over 18"
}
if age1 > 18 || age2 > 18 {
    let _ = "Both are over 18"
}

//The ternary operator

let fCard = 21
let sCard = 21
let result = fCard == sCard ? "Cards are the same":"Cards are different"
//print(result)

//Switch statement
let weather = "sunny"
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
//    fallthrough
default:
    print("Enjoy your day")
}

/*
 The default case is required because Swift makes sure you cove all possible cases so that no eventuality is missed off.
 */

//Range operators
/*
    ..<: this operator (half-open operator) creates ranges up to but excluding the final value
    ...: this operator (closed range operator) creates ranges up to and including the final value.
 */

let score1 = 85
switch score1 {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great.")
}

//One sided ranges
let names = ["Anna","Alex","Brian","Jack"]
for name in names[...2]{
    print(name)
}
print()
for name in names[2...]{
    print(name)
}

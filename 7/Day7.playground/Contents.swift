import UIKit

//Using closures as parameters when they accept parameters

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived.")
}
travel { (place: String) in
    print("I'm going to \(place) in my car.")
}

//Using closures as parameters when they return values
func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let message = action("London")
    print(message)
    print("I arrived.")
}
travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car."
}

//Shorthand parameter names
/*
 Swift knows the parameter to that closure must be a String, so we can remove it:
 */
travel2 { (place) -> String in
    return "I'm going to \(place) in my car."
}
/*
 It also knows the closure must return a String, so we can remove that
 */
travel2 { place in
    return "I'm going to \(place) in my car."
}
/*
    As the closure onlye has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too:
 */
travel2 {place in
    "I'm going to \(place) in my car."
}
/*
    Swift has a shorthand syntax that lets you go even shorter. Rather than writing 'place in' we can let Swift provide automatic names for the closure's parameters. These are named with a dollar sign, then a number counting from 0.
 */
travel2 {
    "I'm going to \($0) in my car."
}


//Closures with multiple parameters
print()
func travel3(action: (String,Int) -> String) {
    print("I'm getting ready to go.")
    print(action("London",60))
    print("I arrived.")
}
travel3 {
    "I'm going to \($0) at \($1) mph."
}
 
//Returning closures from functions
func travel4() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
let result = travel4()
result("London")
let result2 = travel4()("London")

//Capturing values
/*
    If you use external values inside your closure, Swift captures them - stores them alongside the closure, so they can be modified even if they don't existe anymore. 
 
 */
print()
func travel5() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result3 = travel5()
result3("London")
result3("London")
result3("London")


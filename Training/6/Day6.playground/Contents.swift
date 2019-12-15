import UIKit

//Closures

/*
 Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.
 
 Functions used in this way are called closures.
 
 */

let driving = {
    print("I'm driving my car")
}
driving()

//Accepting parameters in a closure

/*
 When you create a closure, they don't have a name or space to write any parameters. To make closures accepts parameters, list them inside parentheses just after opening brace, then write in so that Swift knows the main body of the closure is starting.
 */
let driving2 = { (place: String) in
    print("I'm going to \(place) in my car.")
}

driving2("London")

//Returning values from a closure
/*
    Closures can also return values, and they are written similarly to parameters: you write them inside your closure.
 */
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car."
}
let message = drivingWithReturn("London")
print(message)

//Closures as parameters

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)

//Trailing closure syntax
/*
    If the last parameter to a function is a closure, Swift lets you use a syntax called trailing closure. Rather than pass in your closure as a paremeter, you pass it directly after the function inside braces.
 */

travel {
    print("I'm driving my car.")
}

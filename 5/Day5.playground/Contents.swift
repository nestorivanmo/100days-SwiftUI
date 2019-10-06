import UIKit

//Functions

/*
    Let us re-use code, which means we can write a function to do sth interesting then run that function lots of places.
    
    Functions helps us avoid repeating code.

 */

func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and MyApp will resize them all into thumbnails
"""
    print(message)
}
printHelp()

//Accepting parameters

print("Hello, world!")

func square(number: Int) {
    print(number * number)
}

square(number: 5)

//Returning values
func square_(number: Int) -> Int {
    return number * number
}

print(square_(number: 5))

//Parameters labels


func sayHello(to name: String) {
    print("Hello, \(name)!")
}
sayHello(to: "Taylor")

//Omitting parameter labels
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")


//Default parameters

func greet2(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    }else {
        print("Oh no, it's \(person) again...")
    }
}

greet2("Taylor")
greet2("Taylor",nicely: false)

//Variadic functions
/*
 Some functions are variadic, which is a fancy way of saying they accept any number of parameters of the same type.
 */
print("Haters","gonna","hate")

func square2(numbers:Int...) {
    for n in numbers {
        print("\(n) squared is \(n * n)")
    }
}

square2(numbers: 1,2,3,4,5)

//Throwing functions
/*
    Swift lets us throw errors from functions by marking them as throws before their return type, then using the throw keyword when something went wrong.
 
    First we need to define an enum to define the types of errors
*/

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

//Running throwing functions

/*
    do: starts a section of code that might cause problems
    try: is used before every function that might throw an error
    catch: lets you handle errors gracefully
 */

do {
    try checkPassword("password")
    print("password is good")
} catch {
    print("You can't use that password")
}

//In-out parameters

/*
    All parameters passed into Swift functions are constants, so you can't change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.
 */

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)


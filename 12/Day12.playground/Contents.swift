import UIKit

//Optionals
/*
    They try to answer the question: what happens if my variable does not have a value?
*/

//Handling missing data
/*
    You  can make optionals out of any type
*/

//age holds nothing
var age: Int? = nil

//Unwrapping optionals
/*
    Optinal strings might contain a string or they might be nil. Therefore, we must look inside the optional and see what's there.
 */
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
}else {
    print("empty string")
}


//Unwrapping with guard
/*
    guard let statement also unwraps optionals; but if it finds nil, it expects you to exit the function, loop or condition.
*/
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You did'nt provide a name!")
        return
    }
    print("Hello, \(unwrapped)")
}

//Force unwrapping
/*
    Optionals represents data that may or may not be there, but sometimes you know for sure that a value isn't nil. In these cases, Swift lets you force unwrap the optional: convert it from an optional type to a non-optional type
 
    Force unwrap only when you know it's safe
 */
let str = "5"
let num = Int(str)!

//Implicitly unwrapped optionals
/*
    These might contain a value or be nil. However, you don't need to unwrap them in order to use them.
 
    They exist because sometimes a variable will start life as nil, but will always have a value before you need to use it. Because you know they will have a value by the time you use need them, it's helpful not having to write if let all the time.
 */
let years: Int! = nil


//Nil coalescing
/*
    This operator unwraps an optional and returns the value inside if there is one. If the optional value was nil, the default value is used instead.
 */

func username(for id: Int) -> String? {
    if id == 1 {
        return "TS"
    }else {
        return nil
    }
}

//nil coalescing operator: ??
let user = username(for: 15) ?? "Anonymous"


//Optional chaining
/*
    Swift provides a shortcut when using a optional:
    a.b?.c -> Swift checks if b has a value
 */

let names = ["John","Paul","George","Ringo"]
let beatle = names.first?.uppercased()


//Optional try
/*
    
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

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
}else{
    print("oh oh")
}

try! checkPassword("sekrit")
print("OK!!")


//Failable initializers

/*
    Initializer that might or might not work
*/
let some = "5"
let n = Int(some)

struct Person {
    var id: String
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}
let p = Person(id: "123456789")


//Typecasting
/*
    Swift must always know the type of each of your variables
 */

class Animal {}
class Fish: Animal {}
class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

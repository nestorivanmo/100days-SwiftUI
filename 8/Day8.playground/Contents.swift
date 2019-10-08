import UIKit

//Structs: part one

/*
    Structs let us create our own data types out of several small types.
    Swift lets you design your own types in two ways, of which the most common are called structures. Structs can be given their own variables and constants, and their own functions, then created and used however you want.
*/

struct Sport {
    //properties
    var name: String
}
//instance of the struct
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"

//Computed properties
/*
    Property that runs code to figure out its value. Computed Properties must always have a type and cannot be constants. 
 */
struct Food {
    var name: String
    var isHealthyFood: Bool
    var healthStatus: String {
        if isHealthyFood {
            return "\(name) is healthy."
        } else {
            return "\(name) is not healthy."
        }
    }
}
let frenchFries = Food(name: "French Fries", isHealthyFood: false)
print(frenchFries.healthStatus)

//Property Observers

/*
    This observer lets you run code before or after any property changes. Property observers should never be on constants.
*/

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//Methods
/*
    Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called methods, but they still use the same func keyword.
 */
struct City {
    var population: Int
    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()

//Mutating methods
/*
    If a struct has a variable property but the instance of the struct was created as a constant, that proerty can't be changed - the struct is constant, so all its properties are also constant regardless of how they were created.
    
    Swift won't let you write methods that change properties unless you specifically request it.
 */

struct Person {
    var name: String
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
person.makeAnonymous()
person.name

//Properties and methods of strings
/*
    Strings are structs
 */

let string = "Do or do not, there is no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

//Properties and methods of arrays
/*
   Arrays are structs
*/
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)

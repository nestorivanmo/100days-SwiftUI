import UIKit

//Arrays

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Star"

let beatles = [john,paul,george,ringo]
beatles[1]

//Sets: collection of values but items are stored randomly and all items must be unique

let colors = Set(["red","green","blue"])
let colors2 = Set(["red","green","blue","red"])

//Tuples: allow you to store several values together in a single value.
/*
    1. You can't add or remove items from a tuple; they are fixed in size
    2. You can't change the type of items in a tuple; they always have the same types they were created with.
    3. You can access items in a tuple using numerical positions or by naming them, but Swift won't let you read numbers or names that don't exist.
 */

var name = (first: "Taylor", last: "Swift")
name.0
name.first
name.last = "Sw"
name

//Arrays vs. Sets vs. Tuples
/*
    Tuple: when you need a specific, fixed collection of related values where each item has a precise position or name
 */

let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

/*
    Set: when you need a collection of values that must be unique or you need to be able to check whether a specific items is in there extremely quickly
 */
let set = Set(["aardvark","astronaut","azalea"])

/*
    Array: when you need a collection of values that can contain duplicates, or the order of the items matters
 */
let pythons = ["Eric","Graham","John","Michael"]


//Dictionaries

/*
    Dictionary: collections of values just like arrays, but rather than storing things with an integer position you can access them using anything you want (a key).
 
    The most common way of storing dictionary data is using Strings.
 */

let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

heights["Taylor Swift"]


//Dictionary default values

/*
    If you try to read a value from a dictionary using a key that doesn't exist, Swift will send you back nil. However, we can provide a default value to use if we request a missing key
 */

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Charlotte", default:"Unknown"]

//Creating empty collections

/*
    Arrays, sets and dictionaries are called collections, because they collect values together in one place.
*/

//empty dictionary
var teams = [String:String]()

teams["Paul"] = "Red"

//empty array
var results = [Int]()

//empty set
var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String,Int>()
var results2 = Array<Int>()

//Enumerations
/*
    Usually called enums, are a way of defining groups of related values in a way that makes them easier to use.
 */

let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure

//Enum associated values
/*
    enums can also store associated values attached to each case. This lets you attach information to your enums so they can represent more nuanced data.
*/

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singning(volume: Int)
}

let talking = Activity.talking(topic: "football")

//switch talking {
//case let .talking(topic):
//    print("Talking \(topic)")
//default:
//    print("")
//}

//Enum raw values
/*
    Sometimes you need to be able to assign values to enums so they have a meaning. This lets you create them dynamically, and also use them in different ways.
*/

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3)

enum ASCIIControlCharacter : Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

let tab = ASCIIControlCharacter(rawValue: "\t")


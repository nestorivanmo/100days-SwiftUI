import UIKit

//Protocols

/*
    Protocols are a way of describing what properties and methods something must have. You then tell Swift which types use that protocol - a process known as adopting or conforming to a protocol.
 */
protocol Identifiable {
    //variable id that can be read ('get') or written ('set')
    var id: String {get set}
}
struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}
let user = User(id: "129876")
displayID(thing: user)


//Protocol inheritance
/*
    One protocol can inherit from another in a process knows as 'protocol inheritance'. Unlike with classes, you can inherit from multiple protocols at the same time before you add your own customizations on top.
 */
protocol Payable {
    func calculateWages() -> Int
}
protocol NeedsTraining {
    func study()
}
protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {}
//now we can make types to conform to that single protocol rather than each of the three individual ones.


//Extensions

/*
    Extensions allow you to add methods to existing types, to make them do things they weren't originally designed to.
*/
extension Int {
    func squared() -> Int {
        return self * self
    }
}
let number = 8
number.squared()

/*
 Swift doesn't let you add stored properties in extensions, so you must use computed properties instead.
*/
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}
number.isEven


//Protocol extensions

/*
    Protocols let you describe what methods something should have, but don't provide the code inside. Extensions let you provide the code inside your methods, but only affect one data type - you can't add the method to lots of types at the same time.
 
    Protocol extensions solve both those problems: they are like regular extensions, except rather than extending a specific type, you extend a whole procotol so that all conforming types get your changes.
*/
let pythons = ["Eric","Graham","John","Michael"]
let beatles = Set(["John","Paul","George","Ringo"])

//Swift's arrays and sets conform to a protocol called Collection
extension Collection {
    func summarize() {
        print("There are \(self.count) of us:")
        for name in self {
            print("\t\(name)")
        }
    }
}
pythons.summarize()
beatles.summarize()


//Protocol Oriented Programming

/*
    Programming technique where you craft your code around protocols and protocol extensions.
    Practice of designing your app arquitecture as a series of protocols, then using protocol extensions to provide default implementations.
 */

protocol Identifiable2 {
    var id: String {get set}
    func identify()
}

extension Identifiable2 {
    func identify() {
        print("My ID is \(self.id)")
    }
}

struct User2: Identifiable2 {
    var id: String
}
let nestorivanmo = User2(id: "nestorivanmo")
nestorivanmo.identify()

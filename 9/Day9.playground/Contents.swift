import UIKit

//Initializers
/*
Initializers are special methods that provide different ways to create your struct. All structs come with one by default called 'memberwise initializer' which asks you to provide a value for each property when you create the struct.
 */

struct User {
    var username: String
    //we can provide our own initializer to replace the default one
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var user = User()
user.username
user.username = "nestorivanmo"

//Refering to the current instance
/*
    Inside methods you get a special constant called 'self', which points to whatever instance of the struct is currently being used. This self value is particularly useful when you create initializers that have the same parameter names as your property.
*/

struct Person {
    var name: String
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

//Lazy properties

/*
 As a performance optimization, Swift lets you create some properties only when they are needed.
*/
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}
print("\nWithout lazy properties")
var ed = Person2(name: "Ed")

struct Person3 {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}
print("\nNow with lazy properties")
var ed2 = Person3(name: "Ed")
//ed2.familyTree



//Static properties and methods
/*
    All the properties and methods we've created so far have belonged to individual instances of structs.
*/
struct Student {
    var name: String
    
    init(name: String){
        self.name = name
    }
}

let ed3 = Student(name: "Ed")
let taylor = Student(name: "Taylor")

/*
    You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as 'static'.
*/

struct Student2 {
    static var classSize = 0
    var name: String
    
    init(name: String){
        self.name = name
        Student2.classSize += 1
    }
}
let ed4 = Student2(name: "Ed")
let taylor2 = Student2(name: "Taylor")
print(Student2.classSize)


//Access Control
/*
    Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly.
 */
struct Human {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(self.id)"
    }
}
let max = Human(id: "12345")
max.identify()


import UIKit

//Classes
/*
    Classes are similar to structs in that they allow you to create new types with properties and methods, but they have five main differences.
*/

/*
 1. Classes never come with a memberwise initializer
*/
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}
let bongo = Dog(name: "Bongo", breed: "?")

//Class inheritance
/*
    2. You can create a class based on an existing class, it inherits all the properties and methods of the original class
 
    The child class should call the parent class init at some point at least.
 */

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
let p = Poodle(name: "P")
p.makeNoise()

//Overriding methods
/*
    Child classes can replace parent methods with their own implementations - a process known as overriding.
*/

class Husky: Dog {
    init(name: String) {
        super.init(name: name, breed: "Husky")
    }
    override func makeNoise() {
        print("Yip!")
    }
}

let husky = Husky(name: "H")
husky.makeNoise()

//Final classes
/*
    Sometimes you want to disallow other developers from building their own class based on yours.
 
    When you declare a class as being final, no other class can inherit from it. This means you cannot override your methods in order to change your behavior - they need to use your class the way it was written.
*/
 
final class A {
    var someP: String
    
    init(someP: String) {
        self.someP = someP
    }
    
    func someM() {
        print("some m")
    }
}


//Copying objects
/*
    3. When you copy a struct, both the original and the copy are different things - changing one won't change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.
*/
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)
var singerCopy = singer
singerCopy.name = "JB"
print(singer.name)


//Deinitializer
/*
    4. Classes can have deinitializers - code that gets run when an instance of a class is destroyed.
*/
class Person  {
    var name = "John Doe"
    init() {
        print("\(name) is alive!")
    }
    deinit {
        print("\(name) is dead")
    }
}
for _ in 1...2{
    let pe = Person()
}


//Mutability
/*
    5. The final difference is the way classes and structs deal with constants. If you have a constant struct with a variable property, that property can't be changed because the struct itself is constant. However, if you have a constant class with a variable property, that property can be changed.
*/

struct F {
    var foo = 23
    mutating func change() {
        self.foo = 10
    }
}

var f = F()
f.change()
print(f.foo)

class W {
    var foo = 23
}

let w = W()
w.foo = 20
print(w.foo)


class Magazine {
    var pageCount = 132
}
var example = Magazine()
var wired = example
wired.pageCount = 164
var vogue = example
vogue.pageCount = 128
print(wired.pageCount)
print(vogue.pageCount)

class X {
    func some() {
        print("...")
    }
}

class U {
    func another() {
        print("...")
    }
}


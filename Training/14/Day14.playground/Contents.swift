import UIKit

//Swift review, day two

//Functions

func favoriteAlbum(name: String){
    print("My favorite album is \(name)")
}
favoriteAlbum(name:"The Joshua Tree")

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year).")
}
printAlbumRelease(name: "The Number of the Beast", year: 1983)


func countLetters(in string: String) {
    print("The string '\(string)' has \(string.count) letters.")
}
countLetters(in: "Hello, world")

func albumIsTaylors(name: String) -> Bool {
    switch name {
    case "Taylor Swift","Fearless":
        return true
    default:
        return false
    }
}
if albumIsTaylors(name: "Taylor Swift") {
    print("That's one of hers")
} else {
    print("Who made that?")
}

if albumIsTaylors(name: "The White Album") {
    print("That's one of hers")
} else {
    print("Who made that?")
}


//Optionals

func getHaterStatus(weather: String) -> String? {
    switch weather {
    case "sunny":
        return nil
    default:
        return "Hate"
    }
}

var status = getHaterStatus(weather: "rainy")

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = status {
    takeHaterAction(status: haterStatus)
} else {
    print("nothing to see here ")
}

func yearAlbumReleased(name: String) -> Int? {
    switch name {
    case "Taylor Swift":
        return 2001
    case "Fearless":
        return 2003
    default:
        return nil
    }
}


//Optional chaining

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006:
        return "Taylor Swift"
    case 2008:
        return "Fearless"
    default:
        return nil
    }
}

//nil coalescent operator
let album = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album)")


//Enumerations

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getSomeStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .cloud, .wind, .snow:
        return "dislike"
    case .rain:
        return "hate"
    }
}
getSomeStatus(weather: .cloud)

//Value bindings
func getHaterStatus2(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh -> \(speed)"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}
getHaterStatus2(weather: .wind(speed: 5))

//Structs

struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes).")
    }
}
let taylor = Person(clothes: "T-shirts", shoes: "Sneakers")
let other = Person(clothes: "Short skirts", shoes: "High heels")

print(taylor.clothes)
print(other.shoes)

var taylorCopy = taylor
taylorCopy.shoes = "Flip flops"

print(taylor)
print(taylorCopy)


//Classes
class Person_ {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La la la la")
    }
}

let singer = Singer(name: "Taylor", age: 25)
singer.name
singer.age
singer.sing()

class CountrySinger: Singer  {
    override func sing() {
         print("trucks and more")
    }
}

let countrySinger = CountrySinger(name: "Rick", age: 45)
countrySinger.name
countrySinger.age
countrySinger.sing()

class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    override func sing() {
        print("Singing at: \(self.noiseLevel) db")
    }
}

let bruce = HeavyMetalSinger(name: "Bruce", age: 68, noiseLevel: 100)
bruce.name
bruce.age
bruce.sing()


class Singer_ {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    @objc func sing() {
        print("la la la")
    }
}

@objcMembers class Singer__ {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func sing() {
        print("la la la")
    }
}

import UIKit

//Swift review day three

//Properties

struct Person {
    //property observers
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let otherPerson = Person(clothes: "Skirts", shoes: "high heels")
taylor.describe()
otherPerson.describe()
taylor.clothes = "short skirts"

struct DogOwner {
    var age: Int
    var ageInDogYears: Int {
        return age * 7
    }
}
var fan = DogOwner(age: 25)
fan.ageInDogYears


//Static properties and methods

struct TaylorFan {
    static var favoriteSong = "Look what"
    
    var name: String
    var age: Int
}

let tFan = TaylorFan(name: "James", age: 25)
TaylorFan.favoriteSong


//Access control
class SomeFan {
    private var name: String?
}


//Polymorphism and typecasting

class Album {
    var name: String
    init(name: String) {
        self.name = name
    }
    func getPerformance() -> String {
        return "The album \(name) sold lots."
    }
}

class StudioAlbum: Album  {
    var studio: String
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots."
    }
}
class LiveAlbum: Album  {
    var location: String
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    override func getPerformance() -> String {
        return "The live album \(name) sold lots."
    }
}

var tSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live", location: "New York")

var allAlbums: [Album] = [tSwift, fearless, iTunesLive]
for album in allAlbums {
    print(album.getPerformance())
    if let studioAlbum = album as? StudioAlbum {
        print("\tStudio: \(studioAlbum.studio)")
    }else if let liveAlbum = album as? LiveAlbum{
        print("\tLocation: \(liveAlbum.location)")
    }
}

for album in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.location)
}


//Closures
let vw = UIView()

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}

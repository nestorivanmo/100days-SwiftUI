import UIKit

var str = "Hello, playground"
str = "Goodbye"

//Swift is type safe: every variable must be of a specific type

var age = 38
var population = 8_000_000

//Multi line strings
var str1 = """
This goes
over multiple
lines
"""
var str2 = """
This does not goes \
over multiple \
lines
"""

//Doubles and booleans
var pi = 3.141
var awesome = true

//String interpolation
var score = 85
var str3 = "Your score was \(score)"
var results = "The test results are here: \(str3)"

//Constants
let taylor = "swift"

//Type annotations
let str4 = "Hello, playground"

//Type inference: Swift can infer the type withou specifying it
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true




import UIKit

//Swift review, day one

//Variables and constants
var name = "Tim McGraw"
name = "Romeo"

//Types of data
/*
    Type annotation. Swift always wants to know what kind of value each variable or constant has. This is a characteristic known as Type Safety.
 
 
    Coding convention: lowerCamelCase for variables and constants && UpperCamelCase for types of data
                    
*/
var someName: String
someName = "Tim McGraw"

var age: Int
age = 25

//Float and Doubles
var lattitude: Double
lattitude = 36.1666667

//Not very accurate Float vs Double
var l: Float
l = -1234586.783334
var longitude: Double
longitude = -1234586.783334


//Boolean
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat = false

/*Two ways of telling Swift what type of value:
        1. Type Annotation
        1. Type Inference
*/
//1.
var anotherName: String
anotherName = "Tim McGraw"
//2.
let anotherAge = 25
let anotherLongitude = -86.789070098


//Operators
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10 //add then assign
b -= 10

var c = 1.1
var d = 2.2
var e = c + d

var sName = "Tim McGraw"
var sName2 = "Romeo"
var both = sName + " and " + sName2

var f = 1.1
var g = 2.2
var h = f + g

h > 3
h >= 3
h > 4
h < 4

var n = "Tim McGraw"
n == "Tim McGraw"

//Not operator !=
stayOutTooLate
!stayOutTooLate

n != "TIM McGraw"


//String interpolation
/*
 binding variables and constants inside a string
 */

var name_ = "Tim McGraw"
var age_ = 25
var lat_ = 36.1666667

"Your name is \(name_), your age is \(age_), your latitude is \(lat_)"

"Your age is \(age_) yearis old. In another \(age) years you will be \(age * 2)."


//Arrays
var evenNumbers = [2,4,6,8]
var songs = ["Shake It Off", "You Belong with Me", "Back to December"]
evenNumbers[0]
songs[0]
songs[1]
songs[2]
type(of: songs)

//Dictionaries
var person = ["Taylor","Alison","Swift","December","taylowrswift.com"]
person[1]
person[3]

var dictPerson = ["firstNamne":"Taylor",
                   "middleName":"Alison",
                   "lastName":"Swift",
                   "month":"December",
                   "website":"taylorswift.com"]
dictPerson["middleName"]
dictPerson["month"]

//Conditional statements

//Loops

//Switch case
let liveAlbums = 1
switch liveAlbums {
case 0...1:
    print("You're just starting out")
case 2...3:
    print("You are a rising star")
case 4...5:
    print("You are world famous")
default:
    print("Have you done something new?")
}

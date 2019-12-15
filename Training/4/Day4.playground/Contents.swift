import UIKit

//For loops
let count = 1...10
for number in count {
    print("Number is \(number)")
}

let albums = ["Red","1989","Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")
for _ in 1...5 {
    print("play")
}

//While loops
var number = 1
while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here I come!")

//Repeat loops
var n = 1
repeat {
    print(n)
    n += 1
} while n <= 20
print("Ready or not, here I come!")

while false {
    print("This is false - while")
}

repeat {
    print("This is false - repeat ")
} while false

//Exiting loops
var cd = 10
while cd >= 0 {
    print(cd)
    cd -= 1
}
print("Blast off!")
cd = 10
while cd >= 0 {
    print(cd)
    if cd == 4 {
        print("I'm bored. Let's go now!")
        break
    }
    cd -= 1
}

//Exiting multiple loops
for i in 1...10 {
    for j in 1...10 {
        let p = i * j
        print("\(i) * \(j) is \(p)")
    }
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

//Skipping items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}

var j = 0
while true {
    print(" ")
    j += 1
    
    if j == 273 {
        break
    }
}

for name in ["Taylor"] {
    print("Welcome, \(name)")
}

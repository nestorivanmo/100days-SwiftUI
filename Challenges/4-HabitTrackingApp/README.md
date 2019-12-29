# Habit Tracking App

## Leaned so far...

[Project 7:](https://github.com/nestorivanmo/100days-SwiftUI/tree/master/Projects/7-iExpense)

- Why **@State** only works with structs
- How to use **@ObservedObject** to work with classes
- How **@Published** lets us announce property changes to any SwiftUI views that are watching
- Presenting and dismissing views using the **sheet()** modifier and **presentationMode**
- Using **onDelete(perform:)** to enable swipe to delete
- Adding **EditButton** to navigation bar items, to let users edit list data more easily.
- Reading and writing data with **UserDefaults**.

- Archiving and unarchiving data with **Codable**, including working with data stored in hierarchy. 
- Using the **Identifiable** protocol to make sure all items can be identified uniquely in our user interface. 

[Project 8:](https://github.com/nestorivanmo/100days-SwiftUI/tree/master/Projects/8-Moonshot)

- How to use **GeometryReader** to make content fit the screen.
- Using **ScrollView** to lay out custom views in a scrollable area. 
- Pushing new views onto the navigation stack using **NavigationLink**.
- Using Swift's **first(where:)** method to find the first element in an array that matches the predicate. 
- Using **layoutPriority()** to adjust how much space is allocated to a view.

[Project 9:](https://github.com/nestorivanmo/100days-SwiftUI/tree/master/Projects/9-Drawing-TechniqueProject)

- Creating custom paths and shapes.
- Creating shapes that can be inset and have their border stroked, using **InsettableShape**.
- Using **CGAffineTransform** to create rotations and translations.
- Enabling Metal for drawing complex views using **drawingGroup**.
- Modifying blend modes and saturation.
- Animating shapes with **animatableData** and **AnimatablePair**.

## Key points

### Classes vs structs: what's the difference and why does it matter?

The fundamental difference between these ways to create complex data types is the following: 

- Classes are **reference type**: instances of a class are stored as a reference to some memory location. 
- Structs are **value type**. 

When we make a variable that holds a struct, the struct's data is stored inside that variable. However, when we use a class, that data is put in memory and the variable holds the memory location to that data in memory. 

In UIKit it was common for developers to create classes for its views and structs for data. While in SwiftUI, it's the otherway around. 

### Using UserDefaults wisely

**UserDefaults** lets us store small amounts of data easily that is ready as soon as our app launches. This has two drawbacks: 

1. You should only store small amounts of data there - anything over 512KB is dubious.
2. You can only store certain types of data easily; everything else must use **Codable** first to get some binary data. 

List of types supported by **UserDefaults**: 

- Strings
- Numbers
- Dates
- URL's
- Binary data 
- Arrays of the previous points

**UserDefaults** writes out its data using a property list (plist -> property list) therefore, it would be strange if **UserDefaults** contained 100,000 entries of data. Apple's own documentation states that **UserDefaults** are called like this 

> because they're commonly used to determine an app's default state at startup or the way it acts by default. 

### When to use generics 

Generic constraints are so useful: they let us say "this can be any kind of object, as long as ..." then provide some restrictions. The key to using Generics is not to use them at first, and when you do need them, add restrictions so that you get the most functionality as possible. 

## Challenge

The objective is to build a habit-tracking app. At the very least, this means there should be a list of all activities people want to track, plus a form to add new activities - a title and description should be enough. Tapping on one of the activities should show a detail screen with the description, how many times they have completed it, plus a button incrementing their completion count. Use **Codable** and **UserDefaults** to load and save all your data. 
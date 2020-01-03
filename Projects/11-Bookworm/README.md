# Bookworm

Canadian software developer Rob Pike once said

> ​	Data dominates. If you've chosen the right data structures and organized things well, the algorithms will almost always be self-evident.  Data structures, not algorithms, are central to programming. 

Objective: **CoreData** -> Apple's framework for working with databases. 

## Creating a custom component with @Binding

**@State**: lets us work with local value types.

**@ObservedObject**: lest us work with sharable reference types.

**@Binding**: lets us connect an **@State** property of one view to some underlying model data. It lets us create a mutable value in a view, that actually points to some other value from elsewhere. 

**@Binding** allows us to create a two-way connection between PushButton and whatever is using it. 

![icon](images/PushButton.png)

![icon](images/PushButton-ContentView.png)

![Alt Text](images/PushButton-Simulator.gif)




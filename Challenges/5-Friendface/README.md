# Friendface

Learned so far...

[Project 10: Cupcake Corner](https://github.com/nestorivanmo/100days-SwiftUI/tree/master/Projects/10-Cupcake)

- Custom **Codable** conformance.
- Sending and receiving data using **URLSession**.
- The **disabled()** modifier for our views.

[Project 11: Bookworm](https://github.com/nestorivanmo/100days-SwiftUI/tree/master/Projects/11-Bookworm)

- Building a custom UI components using **@Bindable**.
- Using **AnyView** for type erasure. 
- Adding multiple buttons to an alert. 

[Project 12: Core Data](https://github.com/nestorivanmo/100days-SwiftUI/tree/master/Projects/12-CoreData-TechniqueProject)

- How Swift's **Hashable** protocol is used in SwiftUI. 
- Using the **@FetchRequest** property wrapper to query Core Data. 
- Sorting Core Data results using **NSSortDescriptor**. 
- Creating **NSManagedObject** subclasses.
- Filtering data using **NSPredicate**. 
- Creating relationships between Core Data entities. 

## Key Points

### AnyView vs Group: type erasure in practice

SwiftUI’s views have only one requirement, which is that they have a `body` property that returns some specific sort of view. By using ```some View``` we are saying to SwiftUI that  “this will return one specific sort of view, but we don’t want to say what”. However, this has a downside: we can’t dynamically determine the type of view we return, therefore the following code is invalid. 

```swift
struct ContentView: View {
    var body: some View {
        if Bool.random() {
            return Text("Hello, World!")
                .frame(width: 300)
        } else {
            return Text("Hello, World!")
        }
    }
}
```

We solve the latter by using *type erasure* which is the process of hiding the underlying type of some data. In SwiftUI we have ```AnyView``` which can hold any kind of view inside it. 

```swift
struct ContentView: View {
    var body: some View {
        if Bool.random() {
            return AnyView(Text("Hello, World!")
                .frame(width: 300))
        } else {
            return AnyView(Text("Hello, World!"))
        }
    }
}
```

However, there is a performance cost to using `AnyView`: by hiding the way our views are structured, we’re forcing SwiftUI to do a lot more work when our view hierarchy changes – if we make one small change SwiftUI inside one of the type erased parts of our view hierarchy, there’s a good chance it will need to recreate the entire thing. There is one alternative which is using a container such as ```Group``` . 

```swift
struct ContentView: View {
    var body: some View {
        Group {
            if Bool.random() {
                Text("Hello, World!")
                    .frame(width: 300)
            } else {
                Text("Hello, World!")
            }
        }
    }
}
```

There are also times when `Group` simply won’t cut it because it doesn’t have the type erasing powers of `AnyView`. For example, you can’t make an array of groups, because `[Group]` by itself has no meaning – SwiftUI wants to know what’s *in* the group. On the other hand, `[AnyView]` is perfectly fine, because the point of `AnyView` is that the contents don’t matter.

```swift
struct ContentView: View {
    @State var views = [AnyView]()

    var body: some View {
        VStack {
            Button("Add Shape") {
                if Bool.random() {
                    self.views.append(AnyView(Circle().frame(height: 50)))
                } else {
                    self.views.append(AnyView(Rectangle().frame(width: 50)))
                }
            }

            ForEach(0..<views.count, id: \.self) {
                self.views[$0]
            }

            Spacer()
        }
    }
}
```

If you intend to use type erasure regularly, it’s worth adding this convenience extension:

```swift
extension View {
    func erasedToAnyView() -> AnyView {
        AnyView(self)
    }
}
```

```swift
Text("Hello World")
    .font(.title)
    .erasedToAnyView()    
```

### Codable keys

```swift
struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }

    var firstName: String
    var lastName: String
}
```


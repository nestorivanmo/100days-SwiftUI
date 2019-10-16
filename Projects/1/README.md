# Project One: Tip calculator

### Understanding the basic structure of a SwiftUI app

1. **AppDelegate.swift**: contains code for managing your app. It used to be common to add code here, but these days it's quite rare.
2. **SceneDelegate.swift** : contains code for launching one window in your app. This is important for the iPad. 
3. **ContentView.swift**: contains the initual UI for the app. 
4. **LaunchScreen.storyboard**: visual editor for creating a small piece of UI to show when your app is launching. 
5. **Info.plist**: collection of special values that describe to the system how your app works - which version it is, which device orientations you support and more. 
6. **Preview.content**: yellow group, with Preview Assets.xcassets inside - this is another asset catalog for images you want to use or the app icon. 

---

### Modifying program state 

*"Our views are function of their state"*. A state is the active collection of settings that describe how the game is right now. Therfore, we mena that the way your user interface looks are determined by the state of your program. This is shift of paradigms because before SwiftUI, your user interface was determined by a sequence of events. The sequence of events approach meants it's very hard to store the state of an app, becasue the only way to get back the perfect state would be to play back the exact sequecne of events taht the user performed. 

Swift gives us a special solution called *property wrapper*: a special attribute we can place before our properties that effectively gives them super powers. 

```swift
@State var tapCount = 0
```

**@State** allows us to work around the limitation of structs (since all the views in SwiftUI are structs): we know we can't change their properties because structs are fixed, but **@State** allows that value to be stored separately by SwiftUI in a place that can be modified.

---

### Binding state to user interface controls 

*Two-way binding*: we bind the text field so that it shows the value of our property, but we also bind it so that any changes to the text field also update the property.

```swift
struct ContentView: View {
    @State private var name = ""

    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Hello World")
        }
    }
}
```


# Multiplication Tables Game (3rd challenge)

## Learned so far...

- Stepper
- DatePicker and displayedComponents
- Date, DateComponents, DateFormatter
- List
- onAppear()
- Bundle (to read files)
- fatalError()
- UITextChecker
- animation()
- withAnimation()
- Multiple animation() modifiers
- DragGesture()

**¡Rememeber!** in SwiftUI all our views - and all our animations - must be a function of our state. In other words, we don't tell the button to spin, but instead, attach the button's spin amount to some state, then modify that state as appropiate.

## Key points

### Ranges with ForEach and List

```ForEach``` needs a ```Range<Int>``` therefore, we could write this:

```swift
ForEach(0..<5) {
  Text("Row \($0)")
}
```

However, if we try the following code it will not compile because ```0...5``` is a ```ClosedRange<Int>``` 

```swift
ForEach(0...5) {
  Text("Row \($0)")
}
```

### Flat app bundles

All iOS, macOS, tvOS and watchOS apps ship as **bundles** that combine their binary file, their Info.plist, their asset catalog and more. When Xcode builds our**Asset catalog** it optimizes all of our images for iOS devices and puts the result in a compiled asset catalog that can be loaded efficiently. **Loose assets** (such as text files, JSON, XML, movies, etc) are grouped intro a single directory called ***resource***. So that when we ask the bundle to find the URL for "start.txt" it doesn't need to search through all the directories in our app bundle, but instead can look in justo ne place because all the files are there. Therefore, we cannot name two loose assets files the same name even though they are in different groups.


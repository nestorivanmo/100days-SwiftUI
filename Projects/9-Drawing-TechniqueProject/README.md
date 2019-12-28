# Drawing: second technique project

Dutch impressionist Vincent Van Gogh once said:

> I sometimes think there is nothing so delightful as drawing

## Introduction

In this project we are going to focus on drawing in SwiftUI, including creating custom paths and shapes, animating your changes, solving performance problems. SwiftUI uses the same drawing system that we have on the rest of Apple's frameworks: Core Animation and Metal. CoreAnimation is responsible for our drawing or UI elements such as TextField and when things get too complex we look for Metal - Apple's low level  framework that's optimized for drawing.

## Creating custom paths with SwiftUI

SwiftUI gives a dedicated Path type to draw custom shapes. Pahts are views in their own right which means we can use them as text views or images. 

![icon](images/Path-Basic.png)

![icon](images/Path-Basic-Simulator.png)

## Paths vs shapes in SwiftUI

SwiftUI enables custom drawing with:

- Path: series of drawing instructions all using absolute coordinates. 
- Shape: has no idea of where it will be used or how big it will be used, but instead will be asked to draw itself inside a given rectangle therefore we don't need to use absoulte coordinates. *Shapes are built using Paths.*

![icon](images/Shape-Basic.png)

![icon](images/Shape-Basic-Simulator.png)

Paths are designed to do one specific thing, whereas shapes have the flexibility of drawing space and can also accept parameters to let us customize them further. 

![icon](images/Shape-Arc.png)

![icon](images/Shape-Arc-Simulator.png)

## Adding strokeBorder() support with InsettableShape

![icon](images/Arc-InsettableShape.png)

![icon](images/Arc-InsettableShape-Simulator.png)

---

## Transforming shapes using CGAffineTransform and even-odd fills

**CGAffineTransform**: how path or view should be rotated, scaled or sheared. 

**Even-odd fills**: allows us to control how overlapping shapes should be rendered. 

![icon](images/Flower-Struct.png)

![icon](images/Ellipses-ContentView-Simple.png)

![Alt Text](images/Ellipses-Simulator.gif)

Now, using even-odd fills...

![icon](images/Ellipses-ContentView-EvenOddFills.png)

![Alt Text](images/Ellipses-EOFills-Simulator.gif)

## Creative borders and fills using ImagePaint

SwiftUI gives us a dedicated type that wraps images in a way that we have complete control over how they should be rendered, which in turn means we can use them for borders and fills without any problem. This type is called **ImagePaint**. 

![icon](images/ImagePaint-scale.png)

![icon](images/ImagePaint-scale-Simulator.png)

Using the second parameter: sourceRect...

![icon](images/ImagePaint-sourceRect-scale.png)

![icon](images/ImagePaint-sourceRect-scale-Simulator.png)

**ImagePaint** can also be used for view backgrounds and aslo shape strokes...

![icon](images/ImagePaint-Capsule.png)

![icon](images/ImagePaint-Capsule-Simulator.png)

## Enabling high-performance Metal rendering with drawingGroup()

SwiftUI uses Core Animation for its rendering by default, which offers great performance out of the box. However, for complex rendering you might find your code starts to slow down - anything below 60 FPS is a problem, but really you ought to aim higher because many iOS devices now render at 120 FPS. 

![icon](images/ColorCyclingCircle-smooth.png)

![icon](images/ColorCyclingCircle-ContentView.png)

![Alt Text](images/ColorCyclingCircle-smooth-Simulator.gif)

However, if we do the following change, SwiftUI struggles to render 100 gradients as part of 100 separate views. 

![icon](images/ColorCyclingCircle-tough.png)

We can fix this by applying the **drawingGroup()** modifier which tells SwiftUI to render the contents of its view into an off-screen image before putting it back onto the screen as a signle rendered output, which is significantly faster. Behind the scenes, this is powerded by **Metal** which is Apple's framework for working directly with the GPU for extremely fast graphics. However, we should wait until we have a performance problem to use **drawingGroup()** since adding the off-screen render pass might slow down SwiftUI for simple drawing. 

![icon](images/ColorCyclingCircle-drawingGroup.png)

![Alt Text](images/ColorCyclingCircle-drawingGroup-Simulator.gif)

---

## Special effects in SwiftUI: blurs, bending and more

Blend modes allows us to control the way one view is rendered on top of another.

![icon](images/BlendMode-multiply.png)

<img src="images/BlendMode-multiply-preview.png" alt="icon" style="zoom:33%;" />

![icon](images/3Circles.png)

![Alt Text](images/3Circles-Simulator.gif)

![icon](images/Blur-Saturation-Example.png)

![Alt Text](images/Blur-Saturation-Example-Simulator.gif)

## Animating simples shapes with animatableData

SwiftUI examines the state of our view before the binding changes, and examines it again after the binding changes, then applying an animation to get from point A to point B. When we use **withAnimation()**, SwiftUI immediately changes our state property to its new value, but behind the scene's, it's also keeping track of the changing value over time as part of the animation. As the animation progresses, SwiftUI will set the **animatableData** property or our shape to the latest value. 

![icon](images/TrapezoidStruct-Shape.png)

![icon](images/TrapezoidAnimation-ContentView.png)

![Alt Text](images/TrapezoidAnimation-ContentView-Simulator.gif)

## Animating complex shapes with AnimatablePair

SwiftUI uses **animatableData** property to let us animate changes to shapes, however, it only works with one property. If we were to work with more properties we need to use **AnimatablePair**. 

**AnimatablePair** contains a pair of animatable values. 

![icon](images/Checkerboard-AnimatablePair.png)

![icon](images/Checkerboard-ContentView.png)

![Alt Text](images/Checkerboard-AnimatablePair-Simulator.gif)

## Creating a spirograph with SwiftUI

![Alt Text](images/Spirograph-Simulator.gif)

---

## Wrapup: Arrow and ColorCyclingRectangle

![icon](images/Arrow-Struct.png)

![icon](images/ColorCyclingRectangle-Struct.png)

![icon](images/Wrapup-ContentView.png)

![Alt Text](images/Wrapup-Simulator.gif)


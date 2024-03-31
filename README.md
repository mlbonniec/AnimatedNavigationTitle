<p align="center">
  <img src="https://github.com/mlbonniec/AnimatedNavigationTitle/assets/29955402/e191cd5a-0f28-4b90-a76a-daddacf17b31" width="350px" />
</p>

# AnimatedNavigationTitle

AnimatedNavigationTitle is simple SwiftUI package that helps you to create animated navigation title, based on the current scroll position.
It's inspired by the animations present on X, Github and Reddit iOS application.

> [!NOTE]
> AnimatedNavigationTitle is available on iOS 15 and later.

# Quick Start
To create an animated title view, you must wrap your view with `AnimatedNavigationTitleView`.
Then, you must add the `.scrollableTitleAnchor()` modifier to the child view that will trigger the animation.

```swift
AnimatedNavigationTitleView("My Custom Title") {
  VStack {
    Text("Hello, World")

    Spacer(minLength: 250)

    Text("Trigger")
      .scrollableTitleAnchor()

    Spacer(minLength: 250)

    Text("…")
  }
}
```

# Configuration  

### Animation
You can specify which animation(s) will be played by passing the `animation: AnimatedNavigationTitleAnimationType` parameter to the `AnimatedNavigationTitleView`.

Examples:
* `AnimatedNavigationTitleView("Title", animation: .slide) {}` title sliding from the bottom. (the default behavior)
* `AnimatedNavigationTitleView("Title", animation: .opacity) {}` title will appear by increasing its opacity.
* `AnimatedNavigationTitleView("Title", animation: .all) {}` both slide and opacity.

### Alignment
Title content alignment can also be configured.

Examples:
* `AnimatedNavigationTitleView("Title", alignment: .leading) {}`
* `AnimatedNavigationTitleView("Title", alignment: .center) {}`
* `AnimatedNavigationTitleView("Title", alignment: .trailing) {}`

# License
This work is licensed under CC BY-SA 4.0.
See [LICENSE](./LICENSE).


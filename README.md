# LazyView
Wrap a View lazily! 🦥

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/LazyView", exact: .init(0, 0, 1))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

## Usage

```swift
NavigationView {
    VStack {
        NavigationLink("Tap me! Init is called beforehand ❌") {
            DetailsView()
        }
        NavigationLink("Tap me! Init is called only after navigation ✅") {
            LazyView(DetailsView())
        }
        NavigationLink("Tap me! Init is called only after navigation ✅") {
            LazyView {
                DetailsView()
            }
        }
        LazyNavigationLink("Tap me! Init is called only after navigation ✅") {
            DetailsView()
        }
        LazyNavigationLink("Tap me! Init is called only after navigation ✅") {
            LazyView(DetailsView())
        }
        LazyNavigationLink("Tap me! Init is called only after navigation ✅") {
            LazyView {
                DetailsView()
            }
        }
    }
}

struct DetailsView: View {
    init() {
        print("Init is called")
    }

    var body: some View {
        Text("Details")
    }
}
```

For details see the Example app.

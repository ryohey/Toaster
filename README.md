# :bread: Toaster

<img width="297" alt="image" src="https://user-images.githubusercontent.com/5355966/227464882-4d0442e0-a186-470e-ba99-597c502168fa.png">

## Installation

Add the git URL from Package Dependencies in Xcode.

```
https://github.com/ryohey/Toaster.git
```

## Usage

```swift
Button("Show Toast") {
    toast.present(.defaultSuccess(text: "Success!"))
}
```

## Setup

1. Add `@StateObject var toast = ToastMessages()`
2. Add `.toast(_, layout:)` to the host view
3. Call `toast.present()`

```swift
struct ContentView: View {
    @StateObject var toast = ToastMessages()

    var body: some View {
        VStack {
            Button("Show Toast") {
                toast.present(.defaultSuccess(text: "Success!"))
            }
        }
        .padding()
        .toast(
            toast,
            layout: .init(padding: .init(
                top: 0,
                leading: 16,
                bottom: 16,
                trailing: 16
            ))
        )
    }
}
```


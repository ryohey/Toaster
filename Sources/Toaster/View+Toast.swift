import SwiftUI

public extension View {
    func toast(_ messages: ToastMessages, layout: Toast.Layout) -> some View {
        modifier(ToastModifier(messages: messages, layout: layout))
    }
}

import SwiftUI

public struct ToastModifier: ViewModifier {
    @ObservedObject var messages: ToastMessages

    public let layout: Toast.Layout

    @ViewBuilder
    public func body(content: Content) -> some View {
        ZStack {
            content

            ForEach(messages.messages) { message in
                Toast(
                    message: message,
                    layout: layout,
                    onClose: { messages.remove(message) }
                )
            }
        }
    }
}

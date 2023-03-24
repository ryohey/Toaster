import Foundation

public class ToastMessages: ObservableObject {
    @Published var messages = [Toast.Message]()

    public init() {}

    public func present(_ message: Toast.Message) {
        messages.append(message)
    }

    public func remove(_ message: Toast.Message) {
        messages.removeAll { $0.id == message.id }
    }
}

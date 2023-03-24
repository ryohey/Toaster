import SwiftUI

public struct Toast: View {
    private let message: Message
    private let layout: Layout
    private let onClose: () -> Void
    private let isPreview: Bool
    @State private var isShowing: Bool = false

    public init(message: Message, layout: Layout, onClose: @escaping () -> Void, isPreview: Bool = false) {
        self.message = message
        self.layout = layout
        self.onClose = onClose
        self.isPreview = isPreview
    }

    public var body: some View {
        VStack {
            Spacer()
            if isShowing {
                message.content
                    .onTapGesture {
                        isShowing = false
                    }
                    .onAppear {
                        // prevent a preview from crashing
                        guard !isPreview else { return }

                        Task {
                            try? await Task.sleep(nanoseconds: UInt64(message.config.duration * 1_000_000_000))
                            isShowing = false
                            // アニメーションが終わるのを適当な時間待つ
                            // (animation から duration が取得できないので)
                            try? await Task.sleep(nanoseconds: UInt64(0.5 * 1_000_000_000))
                            onClose()
                        }
                    }
            }
        }
        .padding(layout.padding)
        .animation(message.config.animation, value: isShowing)
        .transition(message.config.transition)
        .onAppear {
            isShowing = true
        }
    }
}

public extension Toast {
    struct Message: Identifiable {
        public let id = UUID()
        public let content: AnyView
        public let config: Config

        public init(content: AnyView, config: Config) {
            self.content = content
            self.config = config
        }
    }

    struct Config {
        public let duration: TimeInterval
        public let transition: AnyTransition
        public let animation: Animation

        public init(duration: TimeInterval, transition: AnyTransition, animation: Animation) {
            self.duration = duration
            self.transition = transition
            self.animation = animation
        }
    }

    struct Layout {
        public let padding: EdgeInsets

        public init(padding: EdgeInsets) {
            self.padding = padding
        }
    }
}

#if DEBUG
    struct Toast_Previews: PreviewProvider {
        static var previews: some View {
            Toast(
                message: .init(
                    content: AnyView(
                        Text("Hello")
                            .padding(16)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(8)
                    ),
                    config: .init(
                        duration: 9999,
                        transition: .opacity,
                        animation: .linear
                    )
                ),
                layout: .init(padding: .init(top: 0, leading: 16, bottom: 16, trailing: 16)),
                onClose: {},
                isPreview: true
            )
        }
    }
#endif

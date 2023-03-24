import SwiftUI

private struct InfoToast: View {
    let text: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "info.circle")
                .font(.system(size: 26))
                .foregroundColor(.gray)

            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 14))
        }
        .padding(16)
        .background(Color.white)
        .overlay(
            Rectangle()
                .stroke(.white.opacity(0.8), lineWidth: 1)
        )
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.05), radius: 16, x: 0, y: 8)
    }
}

public extension Toast.Message {
    static func defaultInfo(text: String) -> Self {
        Self(
            content: AnyView(InfoToast(text: text)),
            config: .init(
                duration: 3,
                transition: .opacity,
                animation: .easeInOut(duration: 0.5)
            )
        )
    }
}

#if DEBUG
    struct InfoToast_Previews: PreviewProvider {
        static var previews: some View {
            InfoToast(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        }
    }
#endif

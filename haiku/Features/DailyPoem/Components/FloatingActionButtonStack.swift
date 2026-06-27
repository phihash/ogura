import SwiftUI

struct FloatingActionButtonStack: View {
    let primaryAction: () -> Void
    let secondaryAction: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            FloatingActionButton(
                systemName: "text.book.closed",
                accessibilityLabel: "百人一首を開く",
                action: primaryAction
            )

            FloatingActionButton(
                systemName: "plus",
                accessibilityLabel: "追加",
                action: secondaryAction
            )
        }
    }
}

private struct FloatingActionButton: View {
    let systemName: String
    let accessibilityLabel: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(AppColors.fabForeground)
                .frame(width: 48, height: 48)
                .background(AppColors.fabBackground)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.16), radius: 10, x: 0, y: 6)
        }
        .accessibilityLabel(accessibilityLabel)
    }
}

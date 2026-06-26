import SwiftUI

//縦に見えるように
struct VerticalPoemLine: View {
    let line: String
    var fontSize: CGFloat = 24
    var color: Color = .primary

    var body: some View {
        VStack(spacing: 4) {
            ForEach(Array(line.enumerated()), id: \.offset) { _, character in
                Text(String(character))
                    .font(.system(size: fontSize, weight: .semibold, design: .serif))
                    .foregroundStyle(color)
                    .frame(width: fontSize + 4)
            }
        }
    }
}

import SwiftUI

//ホーム画面の日替わり百人一首コンポーネント

struct DailyPoemCard: View {
    let poem: HyakuninPoem
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 18) {
                HStack {
                    Spacer()

                    Text("\(poem.id)番")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                }

                ZStack(alignment: .bottomLeading) {
                    HStack(alignment: .bottom, spacing: 14) {
                        ForEach(Array(poem.poem.reversed()), id: \.self) { line in
                            VerticalPoemLine(line: line)
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 240, alignment: .center)

                    VerticalPoemLine(line: poem.author, fontSize: 16, color: .secondary)
                        .padding(.leading, 20)
                }
            }
            .padding(22)
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel("今日の一首、\(poem.author)")
    }
}

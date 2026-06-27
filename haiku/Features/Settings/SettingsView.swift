import SwiftUI
import Kingfisher

struct SettingsView: View {
    @AppStorage("appearance") private var appearanceRawValue = AppAppearance.light.rawValue
    @State private var showClearCacheConfirmation = false

    private var isDarkMode: Binding<Bool> {
        Binding {
            AppAppearance(rawValue: appearanceRawValue) == .dark
        } set: { isOn in
            appearanceRawValue = isOn ? AppAppearance.dark.rawValue : AppAppearance.light.rawValue
        }
    }

    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    var body: some View {
        List {
            Section {
                VStack(spacing: 8) {
                    if let icons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
                       let primary = icons["CFBundlePrimaryIcon"] as? [String: Any],
                       let iconFiles = primary["CFBundleIconFiles"] as? [String],
                       let iconName = iconFiles.last,
                       let icon = UIImage(named: iconName) {
                        Image(uiImage: icon)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    }

                    Text("小倉百人一首まとめ")
                        .font(.headline)

                    Text("Version \(appVersion)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .listRowBackground(Color.clear)
            }

            Toggle("ダークモード", isOn: isDarkMode)

            Section {
                Button(role: .destructive) {
                    showClearCacheConfirmation = true
                } label: {
                    Text("画像キャッシュを削除")
                }
            }

            Section {
                Link("プライバシーポリシー", destination: AppLinks.privacyPolicy)

                Link("利用規約", destination: AppLinks.termsOfUse)
            }

            Section("データ") {
                if let url = URL(string: HyakuninIsshuStore.data.sourceURL) {
                    Link(HyakuninIsshuStore.data.source, destination: url)
                } else {
                    Text(HyakuninIsshuStore.data.source)
                }
            }
        }
        .navigationTitle("設定")
        .navigationBarTitleDisplayMode(.inline)
        .alert("画像キャッシュを削除", isPresented: $showClearCacheConfirmation) {
            Button("キャンセル", role: .cancel) {}
            Button("削除", role: .destructive) {
                ImageCache.default.clearMemoryCache()
                ImageCache.default.clearDiskCache()
            }
        } message: {
            Text("ダウンロード済みの画像キャッシュをすべて削除します。画像は次回表示時に再ダウンロードされます。")
        }
    }
}

import SwiftUI

@main
struct haikuApp: App {
    @State private var path: [AppRoute] = []

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                DailyPoemView(path: $path)
                    .appNavigationDestinations()
            }
            .appAppearance()
        }
    }
}

enum AppRoute: Hashable {
    case hyakuninIsshu
    case poemDetail(Int)
    case record
    case settings
}

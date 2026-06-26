import SwiftUI

extension View {
    func appNavigationDestinations() -> some View {
        // NavigationStack の path に AppRoute が追加されたとき、
        // 追加された route 1件に対応する遷移先の画面を作る。
        navigationDestination(for: AppRoute.self) { route in
            switch route {
            case .hyakuninIsshu:
                HyakuninIsshuListView()
            case .poemDetail(let poemID):
                if let poem = HyakuninIsshuStore.data.poems.first(where: { $0.id == poemID }) {
                    PoemDetail(poem: poem)
                }
            case .record:
                RecordAccessView()
            }
        }
    }
}

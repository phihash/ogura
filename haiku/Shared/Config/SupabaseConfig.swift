import Foundation

enum SupabaseConfig {
    static let url = URL(string: SupabaseSecrets.urlString)!
    static let anonKey = SupabaseSecrets.anonKey
}

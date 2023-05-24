import Foundation

struct ConfirmResponse: Codable {
    let id: Int
    let username: String
    let password: String
    let token: String
}

import Foundation

struct FormResponse: Codable {
    var id: Int
    var name: String
    var eventDescription: String
    var eventLocation: String
    var eventTime: String
    var userId: Int
}

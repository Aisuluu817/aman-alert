
import Foundation

struct Contact: Codable {
    let name: String
    let phoneNumber: String
    
    public init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}

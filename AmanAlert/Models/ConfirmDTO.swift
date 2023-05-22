
import Foundation

struct ConfirmDTO: Codable {
  let phoneNumber: String
  let code: String
    
    public init(phoneNumber: String, code: String) {
        self.phoneNumber = phoneNumber
        self.code = code
    }
}

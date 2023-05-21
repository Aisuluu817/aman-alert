import Foundation


struct FormDTO: Codable {
    let name: String
    let eventDescription: String
    let eventLocation: String
    let eventTime: String
    
    public init(name: String, eventDescription: String, eventLocation: String, eventTime: String) {
        self.name = name
        self.eventDescription = eventDescription
        self.eventLocation = eventLocation
        self.eventTime = eventTime
    }
}

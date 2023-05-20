
import Foundation

struct News: Codable {
    let id: Int
    let title: String
    let description: String
    let urlImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case urlImage
    }
}

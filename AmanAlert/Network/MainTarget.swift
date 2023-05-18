
import Foundation
import RxMoya
import Moya

enum MainTarget {
    case getNews
    case getNewsById(id: Int)
    case getPsychologists
    case report
    case addContact
}

extension MainTarget : TargetType {
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
    var baseURL: URL {
        return URL(string: "https://aman-alert.herokuapp.com")!
    }
    
    var path: String {
        
        switch self {
            
        case .getNewsById(id: let id) :
            return "/photos/\(id)"
        case .getNews :
            return "/api/news/get-all"
        case .getPsychologists :
            return "/users/1/todos"
        case .addContact:
            return "/contact"
        case .report:
            return "/anket"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNews, .getPsychologists, .getNewsById:
            return .get
        case .report, .addContact:
            return .post
        }
    }
    
        var parameters: [String: Any]? {
            return nil
    }
}

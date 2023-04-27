
import Foundation
import Moya

enum AuthTarget {
    case signin
}

extension AuthTarget : TargetType {
    var task: Moya.Task {
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
        
        case .signin:
            return "/api/auth/sign-in"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
        var parameters: [String: Any]? {
            return nil
    }
}

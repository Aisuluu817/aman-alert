
import Foundation
import Moya

enum AuthTarget {
    case signin
    case smsCode
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
        case .smsCode:
            return "/api/mobile/user/sign-in/resend-sms"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
        var parameters: [String: Any]? {
            return nil
    }
}

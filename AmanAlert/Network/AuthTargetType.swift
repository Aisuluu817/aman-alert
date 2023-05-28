
import Foundation
import Moya

enum AuthTarget {
    case signin(phoneNumber: String)
    case smsCode(phoneNumber: String)
    case confirm(confirmDTO: ConfirmDTO)
}

extension AuthTarget : TargetType {
    var task: Moya.Task {
   
    switch self {
    case .smsCode(let phoneNumber):
        return .requestParameters(parameters: ["phoneNumber": phoneNumber], encoding: URLEncoding.queryString)
    case .confirm(let confirmDTO):
        return .requestParameters(parameters: ["phoneNumber": confirmDTO.phoneNumber, "code": confirmDTO.code], encoding: JSONEncoding.default)
    case .signin(let phoneNumber):
        return .requestParameters(parameters: ["": phoneNumber], encoding: JSONEncoding.default)
    default:
        return .requestPlain
        }
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
        case .confirm:
            return "/api/mobile/user/sign-in/confirm"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signin, .confirm:
            return .post
        case .smsCode:
            return .get
        }
    }
}

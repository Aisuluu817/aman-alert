
import Foundation
import RxMoya
import Moya

enum MainTarget {
    case getNews
    case getNewsById(id: Int)
    case getPsychologists
    case report(_ form: FormDTO)
    case addContact(_ contact: Contact)
    case getAllContacts
}

extension MainTarget : TargetType {
    var task: Task {
        switch self {
        case .addContact(let contact):
            return .requestParameters(parameters: ["name" : contact.name, "phoneNumber": contact.phoneNumber], encoding: URLEncoding.httpBody)
        case .report(let form):
            return .requestParameters(parameters: ["name": form.name, "eventDescription": form.eventDescription, "eventLocation": form.eventLocation, "eventTime": form.eventTime ], encoding: URLEncoding.httpBody)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        if let token = UserDefaults.standard.string(forKey: "token") {
            return ["Authorization": "Bearer " + token]
        } else {
            return ["Content-type": "application/json"]
        }
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
            return "/contact/add"
        case .report:
            return "/form/create"
        case .getAllContacts:
            return "/contact/get-all"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNews, .getPsychologists, .getNewsById, .getAllContacts:
            return .get
        case .report, .addContact:
            return .post
        }
    }
    
        var parameters: [String: Any]? {
            return nil
    }
}

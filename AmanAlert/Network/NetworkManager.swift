import Foundation
import UIKit
import Moya
import RxSwift
import RxMoya

struct NetworkManager {
    static let shared = NetworkManager()
    
    let provider = MoyaProvider<MainTarget>()
    let authProvider = MoyaProvider<AuthTarget>()
    
    public func getNewsById(with id: Int) -> Single<News> {
        provider.rx.request(.getNewsById(id: id))
            .map(News.self)
    }
    
    public func getAllNews() -> Single<[News]> {
        provider.rx.request(.getNews)
            .map([News].self)
    }
    
    public func addContact() {
        provider.rx.request(.addContact)
    }
    
    public func getContacts() -> Single<[Contact]> {
        provider.rx.request(.getAllContacts)
             .map([Contact].self)
    }
    
//    public func report() {
//        provider.rx.request(.report())
//    }
}

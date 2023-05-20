import Foundation
import UIKit
import Moya
import RxSwift
import RxMoya

struct NetworkManager {
    static let shared = NetworkManager()
    
    let provider = MoyaProvider<MainTarget>()
    
    public func getNewsById(with id: Int) -> Single<News> {
        provider.rx.request(.getNewsById(id: id))
            .map(News.self)
    }
    
    public func getAllNews() -> Single<[News]> {
        provider.rx.request(.getNews)
            .map([News].self)
    }
    
    public func signIn(with phoneNumber: String) {
        provider.rx.request(.getPsychologists)
            .map([PsychologistModel].self)
    }
    
    public func report(with phoneNumber: String) {
       // provider.rx.request(.
    }
    
}

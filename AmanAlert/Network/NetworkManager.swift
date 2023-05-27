import Foundation
import UIKit
import Moya
import RxSwift
import RxMoya

struct NetworkManager {
    static let shared = NetworkManager()
    
    let provider = MoyaProvider<MainTarget>()
    let authProvider = MoyaProvider<AuthTarget>()
    
    public func getAllNews() -> Single<[News]> {
        provider.rx.request(.getNews)
            .map([News].self)
    }
    
    public func addContact(_ contact: Contact) -> Single<ContactResponse> {
        provider.rx.request(.addContact(contact))
            .map(ContactResponse.self)
    }
    
    public func getContacts() -> Single<[Contact]> {
        provider.rx.request(.getAllContacts)
             .map([Contact].self)
    }
    
    public func report(_ form: FormDTO) -> Single<FormResponse>{
        provider.rx.request(.report(form))
            .map(FormResponse.self)
    }
    
    public func signIn(_ phoneNumber: String) {
        authProvider.rx.request(.signin(phoneNumber: phoneNumber))
    }
    
    public func resendSMS(_ phoneNumber: String) {
        authProvider.rx.request(.smsCode(phoneNumber: phoneNumber))
    }
    
    public func confirm(_ dto: ConfirmDTO) -> Single<ConfirmResponse>{
        authProvider.rx.request(.confirm(confirmDTO: dto))
            .map(ConfirmResponse.self)
    }
}

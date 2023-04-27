
//  NetworkManager.swift
//  AmanAlert
//  Created by Arstanbaeva Aisuluu on 27.04.2023.

import Foundation
import Moya

struct NetworkManager {
    static let shared = NetworkManager()
    
    let provider = MoyaProvider<MainTarget>()
    
//    public func getNewsById(with id: Int) -> Single<News> {
//        provider.request(.getNewsById(id: id))
//            .map(News.self)
//    }
//
//    public func getAllNews() -> Observable<[News]> {
//        return provider
//            .request(.getNews)
//            .map([News].self).asObservable()
//    }
}

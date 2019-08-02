//
//  ArticlesApiService.swift
//  NeusFeet
//
//  Created by Dzmitry Halauko on 8/2/19.
//  Copyright © 2019 Dzmitry Halauko. All rights reserved.
//

import UIKit
import Foundation
import AlamofireObjectMapper
import RxAlamofire
import RxSwift

class ArticlesApiService {
    
    static func fetchHeadlines() -> Single<Result<[Article], Error>> {
        return request(.get, Endpoints.Articles.headlines.url)
            .mapObject(type: ArticlesSchema.self)
            .map { Result.success($0.articles?.map { $0.toArticle()} ?? [Article]()) }
            .asSingle()
    }
    
}

extension ObservableType {
    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let json = data as AnyObject
            guard let object = Mapper<T>().map(JSONObject: json) else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
                )
            }
            
            return Observable.just(object)
        }
    }
    
    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            let json = data as AnyObject
            guard let objects = Mapper<T>().mapArray(JSONObject: json) else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
                )
            }
            
            return Observable.just(objects)
        }
    }
}

//
//  ArticlesApiService.swift
//  NeusFeet
//
//  Created by Dzmitry Halauko on 8/2/19.
//  Copyright © 2019 Dzmitry Halauko. All rights reserved.
//

import UIKit
import Foundation
import RxAlamofire
import RxSwift

class ArticlesApiService {
    
    static func fetchHeadlines() -> Single<Result<[Article], Error>> {
        return requestJSON(.get, Endpoints.Articles.headlines.url)
            .map({ (data) -> Result<ArticlesSchema, Error> in
                
                
                
                do {
                    let schema = try JSONDecoder().decode(ArticlesSchema.self, from: data.)
                    return Result.success(schema)
                } catch {
                    return Result.failure(error)
                }
            })
            .map({(result: Result<ArticlesSchema, Error>) -> Result<[Article], Error> in
                
                
//                Result.success($0.articles?.map { $0.toArticle()} ?? [Article]())
            })
            .asSingle()
    }
    
}

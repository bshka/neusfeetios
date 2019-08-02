//
//  ArticlesSchema.swift
//  NeusFeet
//
//  Created by Dzmitry Halauko on 8/2/19.
//  Copyright © 2019 Dzmitry Halauko. All rights reserved.
//

import Foundation
import ObjectMapper

struct ArticlesSchema: Mappable {
    var totalResults: Int?
    var articles: [ArticlesItem]?
    var status: String?
    var code: String?
    var message: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        totalResults <- map["totalResults"]
        articles <- map["articles"]
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
    }
    
}

struct ArticlesItem: Mappable {
    var publishedAt: Date?
    var author: String?
    var urlToImage: String?
    var description: String?
    var sourceSchema: SourceSchema?
    var title: String?
    var url: String?
    var content: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        author <- map["author"]
        urlToImage <- map["urlToImage"]
        description <- map["description"]
        title <- map["title"]
        url <- map["url"]
        content <- map["content"]
        sourceSchema <- map["source"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let dateString = map["publishedAt"].currentValue as? String, let _date = dateFormatter.date(from: dateString) {
            publishedAt = _date
        }
    }
    
}

extension ArticlesItem {
    public func toArticle() -> Article {
        var article = Article()
        article.author = author ?? ""
        article.publishedAt = publishedAt ?? Date()
        article.urlToImage = urlToImage ?? ""
        article.description = description ?? ""
        article.sourceId = sourceSchema?.id ?? ""
        article.sourceName = sourceSchema?.name ?? ""
        article.title = title ?? ""
        article.url = url ?? ""
        article.content = content ?? ""
        return article
    }
}

struct SourceSchema: Mappable {
    var name: String?
    var id: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }
}

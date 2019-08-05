//
//  ArticlesSchema.swift
//  NeusFeet
//
//  Created by Dzmitry Halauko on 8/2/19.
//  Copyright © 2019 Dzmitry Halauko. All rights reserved.
//

import Foundation

struct ArticlesSchema: Codable {
    var totalResults: Int?
    var articles: [ArticlesItem]?
    var status: String?
    var code: String?
    var message: String?
    
}

struct ArticlesItem: Codable {
    var publishedAt: Date?
    var author: String?
    var urlToImage: URL?
    var description: String?
    var sourceSchema: SourceSchema?
    var title: String?
    var url: URL?
    var content: String?
}

extension ArticlesItem {
    public func toArticle() -> Article {
        var article = Article()
        article.author = author ?? ""
        article.publishedAt = publishedAt ?? Date()
        article.description = description ?? ""
        article.sourceId = sourceSchema?.id ?? ""
        article.sourceName = sourceSchema?.name ?? ""
        article.title = title ?? ""
        article.content = content ?? ""
        
        if let linkUrl = url {
            article.url = linkUrl
        }
        if let imageUrl = urlToImage {
            article.urlToImage = imageUrl
        }
        return article
    }
}

struct SourceSchema : Codable{
    var name: String?
    var id: String?
}

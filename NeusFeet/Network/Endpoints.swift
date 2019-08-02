//
//  Endpoints.swift
//  NeusFeet
//
//  Created by Dzmitry Halauko on 8/2/19.
//  Copyright © 2019 Dzmitry Halauko. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://newsapi.org/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Articles: Endpoint {
        case headlines, everything
        
        public var path: String {
            switch self {
            case .headlines:
                return "/v2/top-headlines"
            case .everything:
                return "/v2/everything"
            }
        }
        
        public var url: String {
            return "\(API.baseUrl)\(path))"
        }
        
    }
    
    enum Sources: Endpoint {
        case sources
        
        var path: String {
            return "/v2/sources"
        }
        
        var url: String {
            return "\(API.baseUrl)\(path))"
        }
        
        
    }
    
}

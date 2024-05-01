//
//  SearchEndpoint.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

struct SearchEndpoint: Endpoint {
    var path: String
    var httpMethod: HTTPMethod = .get
    var httpHeader: [String : String]?
    var httpBody: Encodable?
    
    init(with text: String) {
        path = "/search/movie?query=\(text)"
        httpHeader = ["Authorization": "Bearer \(Constants.apiKey)"]
    }
}

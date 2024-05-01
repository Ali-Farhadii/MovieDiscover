//
//  MoviesEndpoint.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

struct MoviesEndpoint: Endpoint {
    var path: String
    var httpMethod: HTTPMethod = .get
    var httpHeader: [String : String]?
    var httpBody: Encodable?
    
    init(page: Int) {
        path = "/discover/movie?page=\(page)"
        httpHeader = ["Authorization": "Bearer \(Constants.apiKey)"]
    }
}

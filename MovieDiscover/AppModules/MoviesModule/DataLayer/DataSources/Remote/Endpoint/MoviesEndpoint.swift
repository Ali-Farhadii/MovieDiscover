//
//  MoviesEndpoint.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

struct MoviesEndpoint: Endpoint {
    var path: String = "/discover/movie"
    var httpMethod: HTTPMethod = .get
    var httpHeader: [String : String]? = ["Authorization": "Bearer \(Constants.apiKey)"]
    var httpBody: Encodable?
}

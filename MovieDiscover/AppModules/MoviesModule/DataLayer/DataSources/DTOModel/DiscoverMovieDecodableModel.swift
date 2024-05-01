//
//  DiscoverMovieDecodableModel.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

struct DiscoverMovieDecodableModel: Decodable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [MovieDecodableModel]
}

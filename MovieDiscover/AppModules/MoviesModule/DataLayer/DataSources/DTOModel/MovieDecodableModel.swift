//
//  MovieDecodableModel.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

struct MovieDecodableModel: Decodable {
    let id: Int
    let overview: String
    let title: String
    let posterPath: String?
    let releaseDate: String
}

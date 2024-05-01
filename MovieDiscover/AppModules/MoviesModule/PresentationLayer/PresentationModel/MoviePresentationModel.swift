//
//  MoviePresentationModel.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

struct MoviePresentationModel: Identifiable {
    var id: UUID = UUID()
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
}

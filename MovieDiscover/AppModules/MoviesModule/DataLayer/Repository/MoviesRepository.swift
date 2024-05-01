//
//  MoviesRepository.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func fetchMovies(with pages: Int) async throws -> DiscoverMovieBusinessModel
}

class MoviesRepository: MoviesRepositoryProtocol {
    
    let remoteDataSource: MoviesRemoteDataSource
    
    init(remoteDataSource: MoviesRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchMovies(with pages: Int) async throws -> DiscoverMovieBusinessModel {
        try await remoteDataSource.fetchMovies(with: pages)
    }
}

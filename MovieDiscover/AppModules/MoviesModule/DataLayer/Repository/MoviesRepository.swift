//
//  MoviesRepository.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func fetchMovies() async throws -> DiscoverMovieBusinessModel
}

class MoviesRepository: MoviesRepositoryProtocol {
    
    let remoteDataSource: MoviesRemoteDataSource
    
    init(remoteDataSource: MoviesRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchMovies() async throws -> DiscoverMovieBusinessModel {
        try await remoteDataSource.fetchMovies()
    }
}

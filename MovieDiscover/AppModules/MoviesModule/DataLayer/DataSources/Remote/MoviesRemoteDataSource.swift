//
//  MoviesRemoteDataSource.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

protocol MoviesRemoteDataSource {
    func fetchMovies() async throws -> DiscoverMovieBusinessModel
}

struct MoviesURLSessionDataSource: MoviesRemoteDataSource {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchMovies() async throws -> DiscoverMovieBusinessModel {
        mapDiscoverMoviesToBusinessModel(try await networkService.request(with: MoviesEndpoint()))
    }
    
    private func mapDiscoverMoviesToBusinessModel(_ decodableModel: DiscoverMovieDecodableModel) -> DiscoverMovieBusinessModel {
        DiscoverMovieBusinessModel()
    }
    
    private func mapMovieToBusinessModel(_ decodableModel: MovieBusinessModel) -> MovieBusinessModel {
        MovieBusinessModel()
    }
}

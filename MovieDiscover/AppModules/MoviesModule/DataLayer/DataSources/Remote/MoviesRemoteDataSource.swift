//
//  MoviesRemoteDataSource.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

protocol MoviesRemoteDataSource {
    func fetchMovies(with movieEndpoint: Endpoint) async throws -> DiscoverMovieBusinessModel
}

struct MoviesURLSessionDataSource: MoviesRemoteDataSource {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchMovies(with movieEndpoint: Endpoint) async throws -> DiscoverMovieBusinessModel {
        mapDiscoverMoviesToBusinessModel(try await networkService.request(with: movieEndpoint))
    }
    
    private func mapDiscoverMoviesToBusinessModel(_ decodableModel: DiscoverMovieDecodableModel) -> DiscoverMovieBusinessModel {
        
    }
    
    private func mapMovieToBusinessModel(_ decodableModel: MovieBusinessModel) -> MovieBusinessModel {
        
    }
}

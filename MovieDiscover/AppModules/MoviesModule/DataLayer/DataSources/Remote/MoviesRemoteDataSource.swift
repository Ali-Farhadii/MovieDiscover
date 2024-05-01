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
        DiscoverMovieBusinessModel(page: decodableModel.page,
                                   totalPages: decodableModel.totalPages,
                                   totalResults: decodableModel.totalResults,
                                   results: decodableModel.results.map(mapMovieToBusinessModel(_:)))
    }
    
    private func mapMovieToBusinessModel(_ decodableModel: MovieDecodableModel) -> MovieBusinessModel {
        MovieBusinessModel(title: decodableModel.title,
                           posterPath: decodableModel.posterPath,
                           releaseDate: decodableModel.releaseDate,
                           overview: decodableModel.overview)
    }
}

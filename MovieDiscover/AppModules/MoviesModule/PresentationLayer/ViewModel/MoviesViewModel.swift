//
//  MoviesViewModel.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

class MoviesViewModel: ObservableObject {
    
    @Published var movies: [MoviePresentationModel] = []
    @Published var isLoading = false
    @Published var isError = false
    
    let repository: MoviesRepositoryProtocol
    var page = 1
    var totalPage = 0
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }

    @MainActor func fetchWithLoading() {
        isLoading = true
        Task {
            await fetchMovies()
            isLoading = false
        }
    }
    
    @MainActor
    func fetchMovies() async {
        do {
            let discoveryBusinessModel = try await repository.fetchMovies()
            movies = discoveryBusinessModel.results.map(mapMoviesToPresentationModel(_:))
            totalPage = discoveryBusinessModel.totalPages
        } catch {
            isError = true
        }
    }
    
    private func mapMoviesToPresentationModel(_ businessModel: MovieBusinessModel) -> MoviePresentationModel {
        MoviePresentationModel(title: "", overview: "",
                               posterPath: "", releaseDate: "")
    }
}

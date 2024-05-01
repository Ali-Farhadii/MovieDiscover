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
    @Published var isMoreDataAvailable = false
    
    let repository: MoviesRepositoryProtocol
    var page = 0
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    @MainActor
    func searchMovie(with newValue: String) {
        Task {
            if newValue.isEmpty {
                movies = []
                await fetchMovies()
            } else {
                await searchMovie(with: newValue)
            }
        }
    }
    
    @MainActor
    private func searchMovie(with text: String) async {
        do {
            movies = try await repository.searchMovie(with: text).results.map(mapMoviesToPresentationModel(_:))
        } catch {
            print(error)
        }
    }

    @MainActor 
    func fetchWithLoading() {
        isLoading = true
        Task {
            await fetchMovies()
            isLoading = false
        }
    }
    
    @MainActor
    func fetchMovies() async {
        do {
            page += 1
            let discoveryBusinessModel = try await repository.fetchMovies(with: page)
            movies.append(contentsOf: discoveryBusinessModel.results.map(mapMoviesToPresentationModel(_:)))
            isMoreDataAvailable = page < discoveryBusinessModel.totalPages &&
                                  movies.index(movies.endIndex, offsetBy: -1) < discoveryBusinessModel.totalResults
        } catch {
            isError = true
            page = 0
        }
    }
    
    nonisolated private func mapMoviesToPresentationModel(_ businessModel: MovieBusinessModel) -> MoviePresentationModel {
        MoviePresentationModel(title: businessModel.title,
                               overview: businessModel.overview,
                               posterPath: businessModel.posterPath, 
                               releaseDate: formatDate(businessModel.releaseDate))
    }
    
    nonisolated private func formatDate(_ stringDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: stringDate) ?? .now
        return dateFormatter.string(from: date)
    }
}

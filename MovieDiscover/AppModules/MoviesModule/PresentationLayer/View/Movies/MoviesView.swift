//
//  MoviesView.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                loadingView
            } else if viewModel.isError {
                errorView
            } else {
                moviesListView
            }
        }
        .searchable(text: $searchText)
        .onChange(of: searchText, { _, searchValue in
            viewModel.searchMovie(with: searchValue)
        })
        .refreshable {
            await viewModel.fetchMovies()
        }
        .task {
            viewModel.fetchWithLoading()
        }
    }
    
    var loadingView: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
    }
    
    var errorView: some View {
        VStack {
            Text("Error occurred while loading Data")
                .foregroundColor(.red)
                .padding()
            Button {
                viewModel.fetchWithLoading()
            } label: {
                Text("Try Again")
                    .foregroundColor(.blue)
            }
        }
    }
    
    var moviesListView: some View {
        List {
            ForEach(viewModel.movies, id: \.id) { movie in
                MovieCellView(movie: movie)
            }
            
            if viewModel.isMoreDataAvailable {
                lastRowView
            }
        }
        .listStyle(.plain)
        .navigationTitle("Movies")
    }
    
    var lastRowView: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

#Preview {
    MoviesDependencyContainer().movieView
}

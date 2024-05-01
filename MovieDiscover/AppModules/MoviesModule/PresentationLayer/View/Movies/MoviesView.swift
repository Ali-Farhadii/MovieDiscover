//
//  MoviesView.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesViewModel
    
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
            .navigationTitle("Movies")
    }
    
    var errorView: some View {
        VStack {
            Text("Error occurred while loading Data")
                .foregroundColor(.red)
                .padding()
            Button {
                viewModel.fetchWithLoading()
            } label: {
                Text(NSLocalizedString("Try Again Button Title", value: "Try Again", comment: ""))
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Movies")
    }
    
    var moviesListView: some View {
        List(viewModel.movies) { movie in
            Text("Test")
        }
        .navigationTitle("Movies")
    }
}

#Preview {
    MoviesDependencyContainer().movieView
}

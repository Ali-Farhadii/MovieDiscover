//
//  MovieCellView.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import SwiftUI

struct MovieCellView: View {
    
    let movie: MoviePresentationModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: Constants.imagesBaseURL + movie.posterPath)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 150)
                    .clipShape(.rect(cornerRadius: 15))
            } placeholder: {
                Image(systemName: "text.below.photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 100)
                    .clipShape(.rect(cornerRadius: 8))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .font(.title2)
                
                Text(movie.overview)
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                    .lineLimit(4)
            }
            .padding()
            
            Spacer()
            
            Text(movie.releaseDate)
                .font(.caption)
        }
        .padding(.vertical)
    }
    
}

#Preview {
    MovieCellView(
        movie: MoviePresentationModel(
            title: "Test title",
            overview: "Test ovreview",
            posterPath: "/8QVDXDiOGHRcAD4oM6MXjE0osSj.jpg",
            releaseDate: "Jan 2024"
        )
    )
}

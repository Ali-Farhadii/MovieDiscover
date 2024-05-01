//
//  MoviesDependencyContainer.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation
import SwiftUI

struct MoviesDependencyContainer {
    
    var rootView: some View {
        TabView {
            movieView
                .tabItem {
                    Label("Movies", systemImage: "movieclapper")
                }
            
            aboutView
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
    }
    
    var movieView: some View {
        MoviesView()
    }
    
    var aboutView: some View {
        AboutView()
    }
}

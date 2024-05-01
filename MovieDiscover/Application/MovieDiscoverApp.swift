//
//  MovieDiscoverApp.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import SwiftUI

@main
struct MovieDiscoverApp: App {
    
    let appDependencyContainer = AppDependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            appDependencyContainer.moviesDependencyContainer.rootView
        }
    }
}

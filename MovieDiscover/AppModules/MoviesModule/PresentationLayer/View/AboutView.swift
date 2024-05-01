//
//  AboutView.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                Spacer()
                    .frame(height: 30)
                
                Text("Movie Discover")
                    .font(.largeTitle)
                
                Text("This app is uses the TMDB free APIs to show a list of movies with pagination and search features.\nI have used SwiftUI for UI part and also new Swift concurrency system for networking layer.")
                    .font(.title2)
                    .padding()
                
                Spacer()
                    .frame(height: 50)
                
                HStack {
                    Text("See my LinkedIn page:")
                    
                    Link("LinkedIn", 
                         destination: URL(string: "https://www.linkedin.com/in/ali-farhadi/")!)
                }
                .font(.headline)
                
                Spacer()
                    .frame(height: 30)
                
                HStack {
                    Text("See my GitHub page:")
                    
                    Link("Github",
                         destination: URL(string: "https://www.github.com/Ali-Farhadii")!)
                }
                .font(.headline)
                
                Spacer()
            }
                .navigationTitle("About me")
        }
    }
}

#Preview {
    AboutView()
}

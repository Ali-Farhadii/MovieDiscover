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
                Image(.ali)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(.capsule)
                
                Spacer()
                    .frame(height: 30)
                
                Text("Ali Farhadi")
                    .font(.largeTitle)
                
                Text("iOS Developer")
                    .font(.title)
                
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

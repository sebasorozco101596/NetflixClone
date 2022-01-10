//
//  MoviePreviewRow.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 1/9/22.
//

import SwiftUI

struct MoviePreviewRow: View {
    
    var movies: [Movie]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Previews")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                LazyHStack {
                    
                    ForEach(0..<movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                        
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 10)
                            .padding(.leading, 6)
                    }
                    
                }
            })
        }
        .frame(height: 185)
        
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoviePreviewRow(movies: exampleMovies)
                
        }
    }
}

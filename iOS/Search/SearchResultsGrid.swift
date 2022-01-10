//
//  SearchResultsGrid.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 1/2/22.
//

import SwiftUI
import Kingfisher

struct SearchResultsGrid: View {
    
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns,spacing: 10) {
            
            ForEach(movies, id: \.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(width: 100, height: 200)
                    .padding(.horizontal, 20)
                    .onTapGesture {
                        movieDetailToShow = movie
                    }
            }
        }
        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

struct SearchResultsGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
    }
}

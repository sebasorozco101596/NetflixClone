//
//  BackgroundMovie.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/7/21.
//

import SwiftUI
import Kingfisher

struct BackgroundMovie: View {
    var movie: Movie
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.9)
                .background(
                    // Created in GlobalHelpers
                    LinearGradient.blackOpacityBackgroundImage
                        .padding(.top, 150)
                )
            
            KFImage(movie.thumbnailURL)
                .resizable()
                .zIndex(-1)
                
        }
    }
}

struct BackgroundMovie_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMovie(movie: exampleMovie1)
            
    }
}

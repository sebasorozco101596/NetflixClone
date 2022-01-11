//
//  PreviewVM.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 1/10/22.
//

import Foundation

class PreviewVM: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}

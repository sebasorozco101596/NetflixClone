//
//  ComingSoonVM.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 1/6/22.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}

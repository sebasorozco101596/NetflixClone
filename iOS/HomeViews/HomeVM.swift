//
//  HomeVM.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/5/21.
//

import Foundation

class HomeVM: ObservableObject {
    
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        return movies.keys.map({ String($0)})
    }
    
    public func getMovie(forCat cat: String) -> [Movie] {
        return movies[cat] ?? []
    }
    
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Commedy"] = exampleMovies
        movies["New Releases"] = exampleMovies
        movies["International TV shows"] = exampleMovies
        movies["Terror"] = exampleMovies
        movies["Family"] = exampleMovies
        movies["Comedies"] = exampleMovies
        movies["Sci-Fi Movies"] = exampleMovies
    }
    
}

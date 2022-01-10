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
    
    
    public var allGenres: [HomeGenre] = [.AllGenres, .Action, .Comedy, .Horror, .Thriller]
    
    
    public func getMovie(forCat cat: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre)})
        case .movies:
            return (movies[cat] ?? []).filter({($0.movieType == .movie) && ($0.genre == genre)})
        case .myList:
            return (movies[cat] ?? [])
            // TODO: Setup MyList Property
        }
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

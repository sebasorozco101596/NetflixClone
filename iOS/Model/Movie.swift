//
//  Movie.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/5/21.
//

import Foundation

struct Movie: Identifiable {
    var id: String //= UUID().uuidString
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    // MovieDetail View
    var year: Int
    var rating: String
    var numberOfSeasons: Int? // if is nil is because is a movie
    
    var episodes: [Episode]?
    
    var promotionHeadLine: String?
    
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 season"
            } else {
                return "\(num) seasons"
            }
        }
        
        return ""
    }
    
}

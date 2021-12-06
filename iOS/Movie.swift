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
    
}

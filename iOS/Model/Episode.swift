//
//  Episode.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/6/21.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var thumbnailImageURLString: String
    var description: String
    var length: Int
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}

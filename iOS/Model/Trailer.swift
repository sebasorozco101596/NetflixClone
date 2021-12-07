//
//  Trailer.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/7/21.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
    
}

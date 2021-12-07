//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/5/21.
//

import Foundation
import SwiftUI

let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 1)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travelers", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 2, promotionHeadLine: "Best Rated Show")
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Community", thumbnailURL: URL(string: "https://picsum.photos/200/301")!,  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 3)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: URL(string: "https://picsum.photos/200/302")!,  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 4, promotionHeadLine: "New Episodes Coming Soon")
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Hannibal", thumbnailURL: URL(string: "https://picsum.photos/200/303")!,  categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 5)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "After Life", thumbnailURL: URL(string: "https://picsum.photos/200/304")!, categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 6, promotionHeadLine: "Watch Season 6 now")

let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

extension LinearGradient {
    static let blackOpacityGradientBotton = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
        )
    static let blackOpacityGradientTop = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .bottom,
        endPoint: .top
        )
}

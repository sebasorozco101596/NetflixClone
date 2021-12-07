//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/5/21.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string:
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")!

let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTrailer1 = Trailer(name: "Season 1 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer2 = Trailer(name: "The Hero's Journey", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 1,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Oban, Jantje Friese",
    cast: "Louis Hoffman, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7],
    trailers: exampleTrailers)
let exampleMovie2 = Movie(
    id: UUID().uuidString, name: "Travelers",
    thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Oban, Jantje Friese",
    cast: "Louis Hoffman, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    promotionHeadLine: "Best Rated Show",
    trailers: exampleTrailers)
let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Oban, Jantje Friese",
    cast: "Louis Hoffman, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    trailers: exampleTrailers)
let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Alone",
    thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 4,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Oban, Jantje Friese",
    cast: "Louis Hoffman, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    promotionHeadLine: "New Episodes Coming Soon",
    trailers: exampleTrailers)
let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "Hannibal",
    thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, rating: "TV-MA",
    numberOfSeasons: 5,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Oban, Jantje Friese",
    cast: "Louis Hoffman, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    trailers: exampleTrailers)
let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Oban, Jantje Friese",
    cast: "Louis Hoffman, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    promotionHeadLine: "Watch Season 6 now",
    trailers: exampleTrailers)

let exampleMovie7 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Oban, Jantje Friese",
    cast: "Louis Hoffman, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    promotionHeadLine: "Watch Season 6 now",
    trailers: exampleTrailers)

var exampleMovies: [Movie]  {
    return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6].shuffled()
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Beginings and Endings", description: "Six months after the disappearances, the police form a task from in 2052, Jonas learns that most of Winden perished in an apocalyptic event.", season: 2, episode: 1)

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
    
    static let blackOpacityBackgroundImage = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(1)]),
        startPoint: .top,
        endPoint: .bottom
        )
}
// For to calculate the width of the text
extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

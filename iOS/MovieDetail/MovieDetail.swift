//
//  MovieDetail.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/6/21.
//

import SwiftUI

struct MovieDetail: View {
    
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                    Spacer()
                    
                    Button(action: {
                        // close this view
                    }) {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    }
                }
                .padding(.horizontal, 22)
                .padding(.top, -430)
                .frame(alignment: .top)
                .zIndex(1)
                .foregroundColor(.white)
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        
                        ZStack {
                            
                            BackgroundMovie(movie: movie)
                                .scaledToFill()
                                .frame(width: screen.width, height: 210, alignment: .leading)
                                .edgesIgnoringSafeArea(.all)
                            
                            
                            VStack {
                                StandardHomeMovie(movie: movie)
                                    .frame(width: screen.width / 2.5)
                                
                                MovieInfoSubheadline(movie: movie)
                                
                                if movie.promotionHeadLine != nil {
                                    Text(movie.promotionHeadLine!)
                                        .bold()
                                        .font(.headline)
                                }
                            }
                            
                        }
                        
                        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                            //
                        }
                        
                        //Current Episode Information
                        // 1. Default
                        // 2. Personalized - where the user currently is
                        
                        CurrentEpisodeInformation(movie: movie)
                        
                        
                        CastInfo(movie: movie)
                        
                        HStack(spacing: 60) {
                            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                //
                            }
                            
                            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true) {
                                //
                            }
                            
                            SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                //
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                        CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie1)
                            .padding(.top, 10)
                        
                    }
                    .padding(.top, 30)
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie6)
    }
}

struct MovieInfoSubheadline: View {
    
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)
            
            HDView()
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct HDView: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .strokeBorder(Color.gray, lineWidth: 1)
                .foregroundColor(.gray)
            
            Text("HD")
                .foregroundColor(.gray)
                .bold()
        }
        .frame(width: 30, height: 20)
        
        
    }
}

struct CastInfo: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                
                Spacer()
            }
            
            HStack {
                Text("Creators: \(movie.creators)")
                
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInformation: View {
    
    var movie: Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .foregroundColor(.white)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}

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
            
            VStack {
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
                
                ScrollView(.vertical, showsIndicators: true) {
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
                
                Spacer()
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

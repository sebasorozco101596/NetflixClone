//
//  PopularMovieView.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/22/21.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
    
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width / 3, height: 70, alignment: .center)
                    .padding(.leading, 3)
                    .cornerRadius(10)
                    .clipped()
                    
                
                Text(movie.name)
                
                Spacer()
                
                Button {
                    // Play Movie
                } label: {
                    
                    ZStack {
                        
                        Circle()
                            .strokeBorder(Color.white,lineWidth: 1.5)
                            .background(Circle().foregroundColor(Color.black))
                            .frame(width: 35, height: 35)
                        
                        Image(systemName: "arrowtriangle.right.fill")
                            .frame(width: 30, height: 30)
                    }
                    
                }
                .padding(.trailing, 20)

            }
            .foregroundColor(.white)
            .onTapGesture {
                self.movieDetailToShow = movie
            }
        }
        
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
                .frame(height: 75)
        }
    }
}

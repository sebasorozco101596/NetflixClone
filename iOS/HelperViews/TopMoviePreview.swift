//
//  TopMoviePreview.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/6/21.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    
    var movie: Movie
    
    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
            }
        }
        
        return true
    }
    
    var body: some View {
        
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 5))
                            }
                            
                        }
                    }
                }
                
                HStack {
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        // action
                    }
                    
                    Spacer()
                    
                    PlayButton(text: "Play", imageName: "play.fill") {
                        //action
                    }
                    .frame(width: 120, alignment: .leading)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        // action
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .background(
                LinearGradient.blackOpacityGradientTop
                    .padding(.bottom, 450)
            )
            .background(
                // Created in GlobalHelpers
                LinearGradient.blackOpacityGradientBotton
                    .padding(.top, 250)
            )
            
            
        }
        .foregroundColor(.white)
        
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie5)
    }
}

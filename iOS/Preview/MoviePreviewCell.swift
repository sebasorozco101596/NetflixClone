//
//  MoviePreviewCell.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 1/9/22.
//

import SwiftUI
import Kingfisher

struct MoviePreviewCell: View {
    
    var movie: Movie
    
    let colors: [Color] = [.yellow, .gray, .pink, .red, .blue, .green, .orange]
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(colors.randomElement()))
                .background(LinearGradient.blackOpacityGradientBotton
                                .padding(.bottom, 200))
                
            
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y: -10)
                .frame(height: 65)
        }
    }
}

struct MoviePreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoviePreviewCell(movie: exampleMovie1)
                .frame(width:165, height: 50)
        }
    }
}

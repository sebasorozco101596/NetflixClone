//
//  HomeView.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/5/21.
//

import SwiftUI

struct HomeView: View {
    
    var vm = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // \.SELF is because all the categories are unique
            //Main Vstack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons()
                    
                    TopMoviePreview(movie: exampleMovie6)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1) //Use for to show the topRowButtons. without it the Buttons will be hidden
                    
                    
                    
                    ForEach(vm.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(vm.getMovie(forCat: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                            .onTapGesture {
                                                movieDetailToShow = movie
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .transition(.opacity)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    var body: some View {
        
        HStack {
            
            Button(action: {
                // action
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
                .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                // action
            }, label: {
                Text("TV Shows")
            })
                .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                // action
            }, label: {
                Text("Movies")
            })
                .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                // action
            }, label: {
                Text("My List")
            })
                .buttonStyle(PlainButtonStyle())
            
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}

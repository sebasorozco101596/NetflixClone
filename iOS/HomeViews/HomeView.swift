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
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTowRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // \.SELF is because all the categories are unique
            //Main Vstack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTowRowSelection)
                    
                    TopMoviePreview(movie: exampleMovie6)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1) //Use for to show the topRowButtons. without it the Buttons will be hidden
                    
                    HomeStack(vm: vm, topRowSelection: topRowSelection, selectedGenre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .transition(.opacity)
            }
            
            if showTowRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    
                    VStack(spacing: 40) {
                        
                        
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id:\.self) { topRow in
                            Button {
                                topRowSelection = topRow
                                showTowRowSelection = false
                            } label: {
                                
                                if topRow == topRowSelection {
                                    Text(topRow.rawValue)
                                        .font(.system(size: 30))
                                        .bold()
                                } else {
                                    Text(topRow.rawValue)
                                        .font(.system(size: 23))
                                        .foregroundColor(.gray)
                                }
                            }

                        }
                        
                        Spacer()
                        
                        Button {
                            showTowRowSelection = false
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                                .padding(.bottom, 30)
                                .scaleEffect(x: 1.1)
                                
                        }
                        

                        
                    }
                        
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    
                    VStack(spacing: 40) {
                        
                        
                        Spacer()
                        
                        ScrollView {
                        
                            ForEach(vm.allGenres, id:\.self) { genre in
                                Button (action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {
                                    
                                    if genre == homeGenre {
                                        Text(genre.rawValue)
                                            .font(.system(size: 30))
                                            .bold()
                                    } else {
                                        Text(genre.rawValue)
                                            .font(.system(size: 23))
                                            .foregroundColor(.gray)
                                    }
                                })
                                    .padding(.bottom, 40)

                            }
                            
                        }
                        
                        Spacer()
                        
                        Button {
                            showGenreSelection = false
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                                .padding(.bottom, 30)
                                .scaleEffect(x: 1.1)
                                
                        }
                        

                        
                    }
                        
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
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
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    
    var body: some View {
        
        switch topRowSelection {
        case .home:
            HStack {
                
                Button(action: {
                    // action
                    topRowSelection = .home
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
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                    .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    // action
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                    .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    // action
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                    .buttonStyle(PlainButtonStyle())
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .tvShows, .movies , .myList:
            HStack {
                
                Button(action: {
                    // action
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                    .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                        // action
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180), anchor: .center)
                                .font(.system(size: 10))
                        }
                    })
                        .buttonStyle(PlainButtonStyle())
                    
                    
                    Button(action: {
                        // action
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 13))
                            
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180), anchor: .center)
                                .font(.system(size: 6))
                        }
                    })
                        .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                }
                
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
        
        
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
}

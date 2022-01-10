//
//  SearchBar.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/10/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = true
    
    @Binding var isLoading : Bool
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            if isEditing {
                Color.graySearchBackground
                    .frame(width: screen.maxX - 90, height: 36)
                    .cornerRadius(8)
            } else {
                Color.graySearchBackground
                    .frame(width: screen.maxX - 16, height: 36)
                    .cornerRadius(8)
            }
            
            
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .background(Color.graySearchBackground)
                    .foregroundColor(.white)
                    .padding(7)
                    .padding(.leading, -7)
                    .accentColor(Color.white)
                    .onTapGesture {
                        isEditing = true
                    }
                    
                
                if !text.isEmpty {
                    if isLoading {
                        Button {
                            // Clear text
                            text = ""
                        } label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure{
                                    $0.color = .white
                                }
                                
                        }
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 5)
                        
                    } else {
                        Button {
                            // Clear text
                            text = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                                .frame(width: 35, height: 35)
                        }
                        .padding(.trailing, 5)
                        
                    }
                }
                
                
                if isEditing {
                    Button {
                        // Clear text, hide both buttons, give up first responder
                        text = ""
                        isEditing.toggle()
                        hideKeyboard()
                        
                        
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchBar(text: .constant(""), isLoading: .constant(false))
        }
        .previewDevice("iPhone 13 Pro Max")
.previewInterfaceOrientation(.portrait)
    }
}

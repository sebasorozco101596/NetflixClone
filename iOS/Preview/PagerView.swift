//
//  PagerView.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 1/9/22.
//

import SwiftUI

struct PagerView<Content: View>: View {
    
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    let content: Content
    
    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            
            HStack {
                self.content
                    .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geo.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring(), value: translation)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        translation = value.translation.width
                    })
                    .onEnded({ value in
                        let offset = value.translation.width / geo.size.width
                        let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                        currentIndex = min(max(Int(newIndex), 0 ), self.pageCount - 1) //The max and min are used for don't get a white page. or a negative page or an pageCount + 1. ARE LIMITS
                        translation = 0
                        print(value.translation.width)
                    })
            )
            
        }
    }
}

struct PagerDummy: View {
    
    @State private var currentIndex: Int = 0
    @State private var translation: CGFloat = .zero
    
    var body: some View {
        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
            Color.red
            Color.black
            Color.green
        }
    }
}


struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerDummy()
    }
}

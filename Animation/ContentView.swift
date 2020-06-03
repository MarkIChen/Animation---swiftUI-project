//
//  ContentView.swift
//  Animation
//
//  Created by Mark Chen on 2020/5/21.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topTrailing, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(dragAmount)
            .gesture(DragGesture()
                .onChanged {self.dragAmount = $0.translation}
                .onEnded {_ in
                    withAnimation(.easeOut) {
                        self.dragAmount = CGSize.zero
                    }
            })
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

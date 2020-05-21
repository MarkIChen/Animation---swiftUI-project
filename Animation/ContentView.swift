//
//  ContentView.swift
//  Animation
//
//  Created by Mark Chen on 2020/5/21.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            //            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.blue)
        .foregroundColor(Color.white)
        .clipShape(Circle())
        .animation(.default)
        .overlay(
            Circle()
                .stroke(Color.red, lineWidth: 5)
                .scaleEffect(animationAmount)
                .opacity(Double(2-animationAmount))
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: false)
            )
                
        ).onAppear {
            self.animationAmount = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

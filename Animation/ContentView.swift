//
//  ContentView.swift
//  Animation
//
//  Created by Mark Chen on 2020/5/21.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading)
            , identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}


struct ContentView: View {
    @State private var showRec = false
    
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    self.showRec.toggle()
                }
            }
            
            if showRec {
                
                Rectangle()
                    .frame(width: 200, height: 200, alignment: .center)
                   
//                    .transition(.asymmetric(insertion: .slide, removal: .opacity))
                    .transition(.pivot)
                 .background(LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .topLeading, endPoint: .bottomLeading))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

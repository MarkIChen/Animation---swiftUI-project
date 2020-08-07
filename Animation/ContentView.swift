//
//  ContentView.swift
//  Animation
//
//  Created by Mark Chen on 2020/5/21.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = ""
    @Published var password = ""
}

struct ContentView: View {
    @ObservedObject private var user =  User()
    
    var body: some View {
        VStack {
            Text("naem: \(self.user.name), password: \(user.password)")
            
            TextField("user name", text: $user.name)
            TextField("password", text: $user.password)
        }
    
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  MMSChallenge
//
//  Created by CTSS Students on 24/8/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView{
            
            NewsView()
                .tabItem {
                    Label("Explore", systemImage: "globe")
                }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

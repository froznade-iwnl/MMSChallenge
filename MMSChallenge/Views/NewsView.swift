//
//  NewsView.swift
//  MMSChallenge
//
//  Created by CTSS Students on 28/8/22.
//

import SwiftUI

extension Color {
    
    static let bgColor = Color("Background")
    
}

struct NewsView: View {
    @StateObject var data = SpaceAPI()
    @State var opac = 0.0

    init(){
        UITableView.appearance().backgroundColor = UIColor(Color.bgColor)
    }
    
    var body: some View {
            
            NavigationView{
            
                VStack{
                    NewsArticleView()
                        .opacity(opac)
                }
                .navigationTitle("Explore")
                .environmentObject(data)
                .onAppear {
                    data.getData()
                    withAnimation(.easeIn(duration: 2)) {
                        opac = 1
                    }
                }
            
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

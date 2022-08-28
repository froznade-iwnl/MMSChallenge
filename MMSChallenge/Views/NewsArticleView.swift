//
//  NewsArticleView.swift
//  MMSChallenge
//
//  Created by CTSS Students on 28/8/22.
//

import SwiftUI

struct NewsArticleView: View {
    
    @EnvironmentObject var data: SpaceAPI
    @Environment(\.openURL) var openURL
    private var textWidth = 300.0
    
    var body: some View {
        ZStack {
            
            Color.bgColor
                .ignoresSafeArea(.all)
            
            List{
                ForEach(data.spaceData){ news in
                    NewsArticle(title: news.title, url: news.url, imageUrl: news.imageUrl, newsSite: news.newsSite, summary: news.summary)
                        .onTapGesture {
                            openURL(URL(string: news.url)!)
                        }
                }
            }
            .refreshable {
                data.getData()
        }
        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView()
            .environmentObject(SpaceAPI())
    }
}

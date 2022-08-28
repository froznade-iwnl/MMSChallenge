//
//  NewsArticleView.swift
//  MMSChallenge
//
//  Created by CTSS Students on 28/8/22.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(newsSite)
                .foregroundColor(.blue)
                .italic()
            
            HStack(alignment: .center){
                CachedAsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .easeInOut)){
                    phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }else{
                        HStack(alignment: .center){
                            ProgressView()
                        }
                    }
                }
            } // EOHSTack
            
            Text(title)
                .font(.headline)
                .padding(8)
            
            Text(summary)
                .font(.body)
                .lineLimit(5)
                .padding(8)
            
        }//EOVSTack
        
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
    NewsArticle(title: "Check", url: "test", imageUrl: "https://i.guim.co.uk/img/media/25b5140573cd6b7a1b8085a3255c72cf/0_111_3342_2006/master/3342.jpg?width=620&quality=45&fit=max&dpr=2&s=5a4f6546f657e68884a786a6ec01e38e", newsSite: "NewsToday", summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget neque nec orci porttitor viverra. Donec imperdiet neque lacus, at pellentesque tortor ultrices eget. Proin tempus bibendum ex, ac tempus enim luctus vitae. Sed libero enim, porta vel bibendum sit amet, fringilla id diam. Donec pretium ligula dolor, in sollicitudin.")
    }
}

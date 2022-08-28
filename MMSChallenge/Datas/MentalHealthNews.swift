//
//  MentalHealthNews.swift
//  MMSChallenge
//
//  Created by CTSS Students on 24/8/22.
//

import Foundation

struct NewsData : Codable, Identifiable {
    var id : Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
}

@MainActor class SpaceAPI: ObservableObject {
    @Published var spaceData : [NewsData] = []
    
    func getData(){
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.spaceData = [NewsData(id: 0, title: "Error", url: "Error", imageUrl: "Error", newsSite: "Error", summary: "Try Again Later!")]
                }
                return
            }
            let spaceNews = try! JSONDecoder().decode([NewsData].self, from: data)
            
            DispatchQueue.main.async {
                print("Data retrieved!\(spaceNews.count)")
                self.spaceData = spaceNews
            }
        }.resume()
        
     
    }
        
}


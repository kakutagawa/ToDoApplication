//
//  GetNewsEventFetcher.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/26.
//

import Foundation

class GetNewsEventFetcher: ObservableObject {
    @Published var articles: [Article] = []

    func getNews() async {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=jp&apiKey=35dcdc32b4964d8ba8f209bb76addc6c") else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let searchedResult = try decoder.decode(News.self, from: data)
            //            let text = String(data: data, encoding: .utf8)
            //            print(text)
            Task { @MainActor in
                self.articles = searchedResult.articles
            }
        } catch {
            print("エラー: \(error)")
        }
    }
}

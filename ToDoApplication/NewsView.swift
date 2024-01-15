//
//  NewsView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/10.
//

import SwiftUI

struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    var source: Source
    var author: String!
    var title: String!
    var description: String!
    var publishedAt: String!

    struct Source: Codable, Identifiable {
        var id: Int?
    }
}

class GetNewsEventFetcher: ObservableObject {
    @Published var articles: [Article] = []

    func getNews() async {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=keyword&apiKey=35dcdc32b4964d8ba8f209bb76addc6c") else {
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

struct NewsView: View {
    @StateObject var store = GetNewsEventFetcher()
    @State var errorMsg = ""
    @State var newsList:[(id: Int, author: String, title: String, description: String, publishedAt: String )] = []

    func getData(data: News) {
        newsList = []
        if(data.articles.count != 0){
            newsList = []

            for i in (0 ... (data.articles.count - 1)){
                self.newsList.append((i,data.articles[i].author,data.articles[i].title, data.articles[i].description, data.articles[i].publishedAt))
            }
        } else {
            errorMsg = "ニュースがありませんでした"
        }
    }

    var body: some View {
        if !errorMsg.isEmpty {
            Text(errorMsg)
        } else {
            List (newsList.indices, id: \.description) { index in
                VStack(alignment: .leading) {
                    Text(newsList[index].author)
                    Text(newsList[index].title)
                    Text(newsList[index].description)
                    Text(newsList[index].publishedAt)
                }
                .padding()
            }
            .onAppear {
                Task {
                    await store.getNews()
                }
            }
        }
    }
}
#Preview {
    NewsView()
}

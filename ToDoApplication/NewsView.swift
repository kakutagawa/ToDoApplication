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
    var author: String?
    var title: String
    var description: String?
    var publishedAt: String
    var urlToImage: String?

    struct Source: Codable, Identifiable {
        var id: String?
    }
}



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

struct NewsView: View {
    @StateObject var store = GetNewsEventFetcher()

    var body: some View {
        List(store.articles, id: \.title) { article in
            VStack(alignment: .leading) {
                Image(article.urlToImage ?? "画像なし")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(article.author ?? "なし")
                Text(article.title)
                Text(article.description ?? "なし")
                Text(article.publishedAt)
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
#Preview {
    NewsView()
}

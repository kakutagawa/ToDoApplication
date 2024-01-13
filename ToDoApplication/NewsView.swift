//
//  NewsView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/10.
//

import SwiftUI

struct NewsSource: Codable {
    let status: String
    let totalResults: Int
    var articles: [Article]
}

struct Article: Codable {
    var id: Int?
    var author: String!
    var title: String
    var description: String!
    var publishedAt: String!
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
            let searchedResult = try decoder.decode(NewsSource.self, from: data)
            Task { @MainActor in
                self.articles = searchedResult.articles
            }
        } catch {
            print("エラー: \(error)")
        }
    }
}

struct NewsView: View {
    @ObservedObject var store = GetNewsEventFetcher()

    var body: some View {
        List {
            ForEach(store.articles, id: \.id) { res in
                VStack(alignment: .leading) {
                    Text(res.author)
                    Text(res.title)
                    Text(res.description)
                    Text(res.publishedAt)
                }
                .padding()
            }
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

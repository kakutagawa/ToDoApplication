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

struct Article: Codable, Hashable {
    var source: Source
    var author: String?
    var title: String
    var description: String?
    var publishedAt: String
    var urlToImage: String?

    struct Source: Codable, Identifiable, Hashable {
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
    @State private var selectedArticle: Article?

    var body: some View {
        VStack {
            Text("News")
                .font(.system(size: 30, weight: .bold, design: .default))
            List(store.articles, id: \.title) { article in
                Button {
                    selectedArticle = article
                //わからんこと：ここに何を入れるか？（ViewControllerを呼び出したい）

                } label: {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.headline)
                                    .foregroundStyle(Color("TextColor"))
                                Spacer()
                                Text(article.publishedAt)
                                    .font(.caption)
                                    .foregroundStyle(Color.gray)
                                Text(article.author ?? "")
                                    .font(.caption)
                                    .foregroundStyle(Color.gray)
                            }
                            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                                image
                                    .resizable()
                                    .frame(width:100, height: 70)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
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

//
//  NewsDetailView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/18.
//

import SwiftUI

struct NewsDetailView: View {
    let newsDetail: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Text(newsDetail.title)
                    .font(.headline)
                    .foregroundStyle(Color("TextColor"))
                Spacer()
            }
            Text(newsDetail.description ?? "なし")
                .font(.subheadline)
                .foregroundStyle(Color("TextColor"))
            AsyncImage(url: URL(string: newsDetail.urlToImage ?? "")) { image in
                image
                    .resizable()
                    .frame(width:300, height: 200)
            } placeholder: {
                ProgressView()
            }
            Text(newsDetail.publishedAt)
                .font(.caption)
                .foregroundStyle(Color.gray)
            Text(newsDetail.author ?? "なし")
                .font(.caption)
                .foregroundStyle(Color.gray)
            Spacer()
        }
        .navigationTitle("記事全文")
    }
}

#Preview {
    NewsDetailView(newsDetail: Article(source: Article.Source(),author: "Kohei AKutagawa" ,title: "ニュースタイトル",description: "本文本文本文本文本文" ,publishedAt: "2024-01-01"))
}

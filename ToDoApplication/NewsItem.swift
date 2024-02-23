//
//  NewsItem.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/26.
//

import Foundation

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

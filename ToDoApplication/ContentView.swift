//
//  ContentView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2023/12/11.
//

import SwiftUI

enum Tab: String {
    case todo = "ToDo"
    case news = "News"

    @ViewBuilder var tabContent: some View {
        switch self {
        case .todo:
            Image(systemName: "checkmark.circle.fill")
            Text(self.rawValue)
        case .news:
            Image(systemName: "newspaper.fill")
            Text(self.rawValue)
        }
    }
}

struct ContentView: View {
    @State private var selectedTab: Tab = .todo

    var body: some View {
        TabView(selection: $selectedTab) {
            ToDoView()
                .tabItem { Tab.todo.tabContent }
                .tag(Tab.todo)
            NewsView()
                .tabItem { Tab.news.tabContent}
                .tag(Tab.news)
        }
    }
}

#Preview {
    ContentView()
}

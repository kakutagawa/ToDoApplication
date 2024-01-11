//
//  ContentView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2023/12/11.
//

import SwiftUI

enum Tab: String {
    case ToDo = "ToDo"
    case News = "News"

    @ViewBuilder var tabContent: some View {
        switch self {
        case .ToDo:
            Image(systemName: "checkmark.circle.fill")
            Text(self.rawValue)
        case .News:
            Image(systemName: "newspaper.fill")
            Text(self.rawValue)
        }
    }
}

struct ContentView: View {
    @State private var selectedTab: Tab = .ToDo

    var body: some View {
        TabView(selection: $selectedTab) {
            ToDoView()
                .tabItem { Tab.ToDo.tabContent }
                .tag(Tab.ToDo)
            NewsView()
                .tabItem { Tab.News.tabContent}
                .tag(Tab.News)
        }
    }
}

#Preview {
    ContentView()
}

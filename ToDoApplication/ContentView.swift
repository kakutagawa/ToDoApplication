//
//  ContentView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2023/12/11.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case todo = "ToDo"
    case news = "News"
}

struct ContentView: View {
    @State private var selectedTab: Tab = .todo

    var body: some View {
        UIKitTabBarController(selectedTab: $selectedTab)
            .onAppear {
                UITabBar.appearance().barTintColor = UIColor.systemBackground
            }
    }
}

#Preview {
    ContentView()
}

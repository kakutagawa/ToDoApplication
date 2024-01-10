//
//  ContentView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2023/12/11.
//

import SwiftUI


struct ContentView: View {
    @State private var selection = 1

    var body: some View {
        TabView(selection: $selection) {
            ToDoView()
                .tabItem {
                    Label("ToDo", systemImage: "checkmark.circle.fill")
                }
                .tag(1)
            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper.fill")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}

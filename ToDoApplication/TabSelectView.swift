//
//  TabSelectView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/19.
//

import UIKit
import SwiftUI

struct TabSelectView: View {
    var body: some View {
        TabView {
            ToDoView()
                .tabItem {
                    Image(systemName: "checkmark.circle.fill")
                    Text("ToDo")
                }
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
        }
    }
}

#Preview {
    TabSelectView()
}

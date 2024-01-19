//
//  TabController.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/19.
//

import SwiftUI

struct UIKitTabBarController: UIViewControllerRepresentable {
    @Binding var selectedTab: Tab

    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        let todoVC = UIHostingController(rootView: ToDoView())
        let newsVC = UIHostingController(rootView: NewsView())

        todoVC.tabBarItem = UITabBarItem(title: Tab.todo.rawValue, image: UIImage(systemName: "checkmark.circle.fill"), tag: 0)
        newsVC.tabBarItem = UITabBarItem(title: Tab.news.rawValue, image: UIImage(systemName: "newspaper.fill"), tag: 1)

        tabBarController.viewControllers = [todoVC, newsVC]
        return tabBarController
    }

    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        uiViewController.selectedViewController = uiViewController.viewControllers?.first
        uiViewController.selectedIndex = Tab.allCases.firstIndex(of: selectedTab) ?? 0
    }
}

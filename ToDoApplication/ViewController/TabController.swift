//
//  TabController.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/19.
//

import SwiftUI

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let todoVC = ToDoViewController()
        let newsVC = UINavigationController(rootViewController: NewsViewController()) 

        todoVC.tabBarItem = UITabBarItem(title: Tab.todo.rawValue, image: UIImage(systemName: "checkmark.circle.fill"), tag: 0)
        newsVC.tabBarItem = UITabBarItem(title: Tab.news.rawValue, image: UIImage(systemName: "newspaper.fill"), tag: 1)

        self.viewControllers = [todoVC, newsVC]
    }
}

struct UIKitTabBarController: UIViewControllerRepresentable {
    @Binding var selectedTab: Tab

    func makeUIViewController(context: Context) -> UIViewController {
        TabBarController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let tabBarController = uiViewController as? TabBarController {
            tabBarController.selectedIndex = Tab.allCases.firstIndex(of: selectedTab) ?? 0
        }
    }
}

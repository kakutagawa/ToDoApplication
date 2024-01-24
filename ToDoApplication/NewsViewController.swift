//
//  NewsViewController.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/21.
//

import UIKit
import SwiftUI

final class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let newsViewController = UIHostingController(rootView: NewsView())
        addChild(newsViewController)
        newsViewController.view.frame = view.bounds
        view.addSubview(newsViewController.view)
        newsViewController.didMove(toParent: self)

        newsViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            newsViewController.view.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 1
            ),
            newsViewController.view.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 1
            ),
            newsViewController.view.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            newsViewController.view.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])
    }
}

final class NewsDetailViewController: UIViewController {
    @Binding var selectedArticle: Article

    override func viewDidLoad() {
        super.viewDidLoad()

        let newsDetailViewController = UIHostingController(rootView: NewsDetailView(newsDetail: selectedArticle))
        addChild(newsDetailViewController)
        newsDetailViewController.view.frame = view.bounds
        view.addSubview(newsDetailViewController.view)
        newsDetailViewController.didMove(toParent: self)
    }
}



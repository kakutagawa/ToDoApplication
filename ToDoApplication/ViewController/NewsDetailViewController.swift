//
//  NewsDetailViewController.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/26.
//

import UIKit
import SwiftUI

final class NewsDetailViewController: UIViewController {
    private var selectedArticle: Article

    init(selectedArticle: Article) {
        self.selectedArticle = selectedArticle
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let newsDetailViewController = UIHostingController(rootView: NewsDetailView(newsDetail: selectedArticle))
        addChild(newsDetailViewController)
        view.addSubview(newsDetailViewController.view)
        newsDetailViewController.didMove(toParent: self)

        newsDetailViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            newsDetailViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            newsDetailViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            newsDetailViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsDetailViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

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

        let todoViewController = UIHostingController(rootView: NewsView())
        addChild(todoViewController)
        todoViewController.view.frame = view.bounds
        view.addSubview(todoViewController.view)
        todoViewController.didMove(toParent: self)
    }
}



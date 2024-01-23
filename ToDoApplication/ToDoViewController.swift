//
//  ToDoViewController.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/22.
//

import UIKit
import SwiftUI

final class ToDoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let todoViewController = UIHostingController(rootView: ToDoView())
        addChild(todoViewController)
        todoViewController.view.frame = view.bounds
        view.addSubview(todoViewController.view)
        todoViewController.didMove(toParent: self)
    }
}

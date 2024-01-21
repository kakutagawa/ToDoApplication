//
//  NewsViewController.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/21.
//

import UIKit
import SwiftUI

class NewsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentNewsView() {
        let controller = UIHostingController(rootView: NewsView())
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
}
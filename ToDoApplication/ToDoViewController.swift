//
//  ToDoViewController.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/21.
//

import UIKit
import SwiftUI

class ToDoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentToDoView() {
        let controller = UIHostingController(rootView: ToDoView())
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
}

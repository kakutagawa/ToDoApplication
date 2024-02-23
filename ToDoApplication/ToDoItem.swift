//
//  ToDoItem.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2024/01/26.
//

import SwiftUI

struct ToDoItem: Hashable, Codable {
    var id = UUID()
    var isChecked: Bool
    var task: String
}

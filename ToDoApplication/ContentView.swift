//
//  ContentView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2023/12/11.
//

import SwiftUI

struct ToDoItem: Identifiable, Codable {
    var id = UUID()
    var isChecked: Bool
    var task: String
}

struct ContentView: View {
    @State var newTask: String = ""
    @State var todoLists: [ToDoItem] = []

    private let todoListKey = "todoListKey"

    var body: some View {
        VStack {
            Text("ToDoリスト")
                .font(.system(size: 30, weight: .bold, design: .default))
            HStack {
                TextField("入力", text: $newTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                Button {
                    if !newTask.isEmpty {
                        let newItem = ToDoItem(isChecked: false, task: newTask)
                        todoLists.append(newItem)
                        newTask = ""
                    }
                } label: {
                    Image(systemName: "plus.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
            }
            ForEach(todoLists.indices, id: \.self) { index in
                HStack {
                    Button {
                        todoLists[index].isChecked.toggle()
                    } label: {
                        Image(systemName: todoLists[index].isChecked ? "checkmark.square" : "square")
                        if todoLists[index].isChecked {
                            Text(todoLists[index].task)
                                .strikethrough()
                                .foregroundStyle(Color("TextColor"))
                        } else {
                            Text(todoLists[index].task)
                                .foregroundStyle(Color("TextColor"))
                        }
                    }
                    Spacer()
                    Button {
                        todoLists.remove(at: index)
                    } label: {
                        Image(systemName: "trash.fill")
                            .padding(.trailing, 20)
                    }
                }
                .padding(.top, 1)
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
            Button {
                todoLists.removeAll()
            } label: {
                Text("リセット")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundStyle(.red)
            }
        }
        .onAppear {
            if let savedToDoLists = UserDefaults.standard.data(forKey: todoListKey) {
                do {
                    let decoder = JSONDecoder()
                    todoLists = try decoder.decode([ToDoItem].self, from: savedToDoLists)
                } catch {
                    print("Failed to decode TodoItems: \(error)")
                }
            }
        }
        .onDisappear {
            do {
                let encoder = JSONEncoder()
                let encodedToDoLists = try encoder.encode(todoLists)
                UserDefaults.standard.set(encodedToDoLists, forKey: todoListKey)
            } catch {
                print("Failed to encode ToDoItems: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}

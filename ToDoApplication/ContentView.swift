//
//  ContentView.swift
//  ToDoApplication
//
//  Created by 芥川浩平 on 2023/12/11.
//

import SwiftUI

struct ContentView: View {
    @State var newItem: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField("入力", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                Button {

                } label: {
                    Image(systemName: "plus.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
            }
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}

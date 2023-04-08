//
//  TodoItem.swift
//  TodoListDemo
//
//  Created by chenxi cheng on 4/5/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
}

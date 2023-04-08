//
//  ListViewModel.swift
//  TodoListDemo
//
//  Created by chenxi cheng on 4/5/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var todoList: [ItemModel] = []
    
    init() {
        getTodoList()
    }
    
    private func getTodoList() {
        self.todoList = [
            ItemModel(title: "I am item 1", isCompleted: false),
            ItemModel(title: "How are you?", isCompleted: false),
            ItemModel(title: "Run DML this Friday", isCompleted: false)
        ]
    }
    
    func deleteItem(indexSet: IndexSet) {
        self.todoList.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        self.todoList.move(fromOffsets: from, toOffset: to)
    }
    
    func updateCompletion(item: ItemModel) {
        if let index = todoList.firstIndex(where: { $0.id == item.id }) {
            self.todoList[index] = item.updateCompletion()
        }
    }
    
    func addItem(item: ItemModel) {
        self.todoList.append(item)
    }
}

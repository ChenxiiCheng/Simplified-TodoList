//
//  ListView.swift
//  TodoListDemo
//
//  Created by chenxi cheng on 4/5/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject private var listViewModel: ListViewModel
    
    private func onDelete(indexSet: IndexSet) {
        listViewModel.deleteItem(indexSet: indexSet)
    }
    
    private func onMove(from: IndexSet, to: Int) {
        listViewModel.moveItem(from: from, to: to)
    }
    
    var body: some View {
        List {
            ForEach(listViewModel.todoList) { item in
                todoItem(item: item)
                    .onTapGesture {
                        withAnimation {
                            listViewModel.updateCompletion(item: item)
                        }
                    }
            }
            .onDelete(perform: onDelete)
            .onMove(perform: onMove)
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

extension ListView {
    private func todoItem(item: ItemModel) -> some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
                .strikethrough(item.isCompleted ? true : false, color: Color.black)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

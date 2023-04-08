//
//  TodoListDemoApp.swift
//  TodoListDemo
//
//  Created by chenxi cheng on 4/5/23.
//

import SwiftUI

@main
struct TodoListDemoApp: App {
    @StateObject private var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}

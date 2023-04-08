//
//  AddView.swift
//  TodoListDemo
//
//  Created by chenxi cheng on 4/6/23.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var newItemTitle: String = ""
    
    let btnColor = Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                TextField("Add a new todo item...", text: $newItemTitle)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                Button {
                    listViewModel.addItem(item: ItemModel(title: newItemTitle))
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("save".uppercased())
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(btnColor)
                        .cornerRadius(10)
                        .shadow(color: Color.purple, radius: 2, y: 1)
                }

                Spacer()
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖋")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}

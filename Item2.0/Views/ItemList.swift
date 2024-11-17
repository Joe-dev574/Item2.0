//
//  ItemList.swift
//  Item2.0
//
//  Created by Joseph DeWeese on 11/13/24.
//

import SwiftUI
import SwiftData

struct ItemList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var showAddItemScreen = false
    var body: some View {
        NavigationStack {
            Group {
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            EditItemScreen(item: item)
                        } label: {
                            ItemCardView( item: item)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
                .sheet(isPresented: $showAddItemScreen, content: {
                    AddItemScreen()
                        .presentationDetents([.height(400)])
                })
                
                
#if os(macOS)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
                .toolbar {
#if os(iOS)
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
#endif
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }///group
        }
    }
        private func addItem() {
            withAnimation {
                showAddItemScreen = true
                //            let newItem = Item(dateAdded: Date())
                //            modelContext.insert(newItem)
            }
        }
    
        private func deleteItems(offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    modelContext.delete(items[index])
                }
            }
        }
    
}

#Preview {
    ItemList()
}

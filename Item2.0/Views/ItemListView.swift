//
//  ContentView.swift
//  Item2.0
//
//  Created by Joseph DeWeese on 11/11/24.
//

import SwiftUI
import SwiftData

struct ItemListView: View {
    //MARK:  PROPERTIES
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var showAddItemScreen = false
    
    var body: some View {
        NavigationSplitView {
            Group {
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            EditItemScreen()
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
                    ToolbarItem(placement: .principal, content: {
                        LogoView()
                    })
                
    #endif
                    ToolbarItem {
                        Button{
                            addItem()
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(Color.accentColor)
                                    .frame(width: 35, height: 35)
                                Image(systemName: "plus")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }
                        }
                                
                        }
                    }
                }
        } detail: {
            Text("Select an item")
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
    ItemListView()
        .modelContainer(for: Item.self, inMemory: true)
}

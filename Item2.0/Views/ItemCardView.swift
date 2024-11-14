//
//  ItemCardView.swift
//  Item2.0
//
//  Created by Joseph DeWeese on 11/11/24.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.init("TaskColor1"), Color.init("TaskColor2")],
    startPoint: .top, endPoint: .bottom)

struct ItemCardView: View {
    //MARK:  PROPERTIES
    @Environment(\.modelContext) private var modelContext
    let item: Item
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
            
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                     
                    
                    Text(item.summary)
                        .font(.body)
                        .fontDesign(.serif)
                        .foregroundStyle(.blue)
                        .lineLimit(3)
                    
                    HStack(alignment: .firstTextBaseline){
                        Spacer()
                        Text("Date Added:")
                            .font(.caption)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                            .foregroundStyle(.secondary)
                        Text(item.dateAdded.formatted(.dateTime))
                            .font(.caption)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                            .foregroundStyle(.secondary)
                        Spacer( )
                    }.padding(.bottom, 3)
                    if let tags = item.tags {
                        ViewThatFits {
                            TagsStackView(tags: tags)
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            TagsStackView(tags: tags)
                        }
                    }
                }.padding(.horizontal, 7)
            }
            .padding()
        }
    }

#Preview {
  
    ItemCardView(item: Item(dateAdded: Date.now, title: "WRMG Weld Excellence", summary: "Weld Quality System Implementation for Weld Manufacturing ", dateStarted: Date.now, dateCompleted: Date.now, status: .Queue, tags: []))
}
